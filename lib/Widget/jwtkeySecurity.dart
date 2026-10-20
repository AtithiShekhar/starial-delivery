import 'package:jaguar_jwt/jaguar_jwt.dart';
import '../Helper/constant.dart';

String getToken() {
  final claimSet = JwtClaim(
    issuer: issuerName,
    maxAge: const Duration(minutes: 5),
  );
  String token = issueJwtHS256(claimSet, jwtKey);
  return token;
}

Map<String, String> get headers => {
  "Authorization": 'Bearer ' + getToken(),
};