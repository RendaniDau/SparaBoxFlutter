class LoginResponse {
  String _accessToken;
  int _expiresIn;
  int _refresh_expires_in;
  String _refresh_token;
  String _token_type;
  int _not_before_policy;
  String _session_state;
  String _scope;

  LoginResponse(
      this._accessToken,
      this._expiresIn,
      this._refresh_expires_in,
      this._refresh_token,
      this._token_type,
      this._not_before_policy,
      this._session_state,
      this._scope);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        json['access_token'],
        json['expires_in'],
        json['refresh_expires_in'],
        json['refresh_token'],
        json['token_type'],
        json['not-before-policy'],
        json['session_state'],
        json['scope']);
  }

  String get accessToken => _accessToken;

  set accessToken(String value) {
    _accessToken = value;
  }

  int get expiresIn => _expiresIn;

  String get scope => _scope;

  set scope(String value) {
    _scope = value;
  }

  String get session_state => _session_state;

  set session_state(String value) {
    _session_state = value;
  }

  int get not_before_policy => _not_before_policy;

  set not_before_policy(int value) {
    _not_before_policy = value;
  }

  String get token_type => _token_type;

  set token_type(String value) {
    _token_type = value;
  }

  String get refresh_token => _refresh_token;

  set refresh_token(String value) {
    _refresh_token = value;
  }

  int get refresh_expires_in => _refresh_expires_in;

  set refresh_expires_in(int value) {
    _refresh_expires_in = value;
  }

  set expiresIn(int value) {
    _expiresIn = value;
  }
}
