// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Auth {
  // 유저 ID
  final String uid;
  // token
  final String token;
  // token type
  final String tokenType;
  // 토큰 만료 시간
  final int expiresIn;
  // 토큰 만료 기한
  final int expiresAt;
  Auth({
    required this.uid,
    required this.token,
    required this.tokenType,
    required this.expiresIn,
    required this.expiresAt,
  });

  Auth copyWith({
    String? uid,
    String? token,
    String? tokenType,
    int? expiresIn,
    int? expiresAt,
  }) {
    return Auth(
      uid: uid ?? this.uid,
      token: token ?? this.token,
      tokenType: tokenType ?? this.tokenType,
      expiresIn: expiresIn ?? this.expiresIn,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_uid': uid,
      'access_token': token,
      'token_type': tokenType,
      'expires_in': expiresIn,
      'expires_at': expiresAt,
    };
  }

  factory Auth.fromMap(Map<String, dynamic> map) {
    return Auth(
      uid: map['user_uid'] as String,
      token: map['access_token'] as String,
      tokenType: map['token_type'] as String,
      expiresIn: map['expires_in'] as int,
      expiresAt: map['expires_at'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Auth.fromJson(String source) =>
      Auth.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Auth(uid: $uid, token: $token, tokenType: $tokenType, expiresIn: $expiresIn, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(covariant Auth other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.token == token &&
        other.tokenType == tokenType &&
        other.expiresIn == expiresIn &&
        other.expiresAt == expiresAt;
  }
}
