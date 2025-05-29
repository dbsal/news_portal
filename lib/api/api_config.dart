class ApiConfig {
  static const String baseUrl = 'https://daelim-server.fleecy.dev';
  static const String funcUrl = '$baseUrl/function/v1';

  static final auth = (login: '$funcUrl/auth/get-token');
}
