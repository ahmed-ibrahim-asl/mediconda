class TokenModel{
   String? accessToken;
   String? refreshToken;
  TokenModel({required this.accessToken,required this.refreshToken});



   Map<String, dynamic> toMap() {
    return {
      'refreshToken': refreshToken,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      accessToken: map['accessToken'] as String?,
      refreshToken: map['refreshToken'] as String?,
    );
  }
}