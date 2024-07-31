
abstract class _ApiConstants {
  static const prodApiUrl = 'https://green-gurdian.vercel.app';
}


class ApiConfig {
  final String baseUrl;
  final String serverConfig;
  static ApiConfig get instance {
    return _instance!;
  }

  ApiConfig._internal({
    required this.baseUrl,
    required this.serverConfig,
  });
  static ApiConfig? _instance;

  static _initProd() {
    _instance = ApiConfig._internal(
      baseUrl: _ApiConstants.prodApiUrl,
      serverConfig: "prod",
    );
  }


  static init({
    required String serverConfig,
  }) {
    switch (serverConfig) {
      default:
        ApiConfig._initProd();
    }
  }
}
