import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink('https://hagglex-backend-staging.herokuapp.com/graphql'),
  ),
);

final String register = """
mutation register(\$data:CreateUserInput!) {
  register(data:\$data) {
 UserRo:user{
 username,
 email,
 phonenumber,
 _id,
 kycStatus,
 referralCode

},
token
  } 
}
""";

final String login = """
mutation login(\$data:LoginInput!) {
  login(data:\$data) {
 LoginRO:user{
 username,
  emailVerified
},
    token
  } 
}
""";

final String getVerCode = """
query getRedisVerifyCode(\$data:RedisVerifyCodeInput!) {
  getRedisVerifyCode(data:\$data) {
 string
  } 
}
""";

final String verifyUser = """
mutation verifyUser(\$data:VerifyUserInput!) {
  verifyUser(data:\$data) {
 UserRO:user{
 username,
  emailVerified
},
    token
  } 
}
""";
