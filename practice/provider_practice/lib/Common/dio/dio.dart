import 'package:actual/Common/const/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomInterceptor extends Interceptor{
  final FlutterSecureStorage storage;

  CustomInterceptor({
    required this.storage
    });

  // 요청을 보낼때 실행
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print('[REQ] [${options.method}] ${options.uri}');
    if(options.headers['accessToken'] == 'true'){
      options.headers.remove('accessToken');

      final token = await storage.read(key: ACCESS_TOKEN_KEY);
      options.headers.addAll({
        'authorization' : 'Bearer $token'
      });
    }

    if(options.headers['refreshToken'] == 'true'){
      options.headers.remove('refreshToken');

      final token = await storage.read(key: REFRESH_TOKEN_KEY);

      options.headers.addAll({
        'authorization' : "Bearer $token"
      });
    }

    super.onRequest(options, handler);
  }

  // 응답을 받을때 실행
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}');
    
    super.onResponse(response, handler);
  }

  // 에러가 났을때 실행
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    //401에러가 났을때
    //토큰을 재발급 받는 시도를 하고 토크닝 재발급되면
    //다시 새로운 토큰으로 요청을 한다.
    print('[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}');
    
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    
    if(refreshToken == null){
      return handler.reject(err);//에러 반환
    }

    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/auth/token';//true면 refreshToken도 만료가 된것

    if(isStatus401 && !isPathRefresh){
      final dio = Dio();

      try{
        final res = await dio.post(
          'http://$IP/auth/token',
          options: Options(
            headers:{
              'authorization' : 'Bearer $refreshToken',
            }
          )
        );

        final accessToken = res.data['accessToken'];

        final options = err.requestOptions;

        options.headers.addAll({
          'authorizatoion' : 'Bearer $accessToken'
        });

        //재발급 토큰 저장
        await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);

        //요청 재전송
        final response = await dio.fetch(options);

        return handler.resolve(response);
      }catch(e){
        return handler.reject(err);
      }

    }
    super.onError(err, handler);
  }
}