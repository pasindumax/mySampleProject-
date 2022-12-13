class EndPoints {
  final String getAccessToken = '/auth/token';
  final String isTokenExpired = '/auth/token/is-expired';
  final String signIn = '/account/sign-in';
  final String signOut = '/account/sign-out';
  final String ws = '/v3?app_id={app_id}';
}
