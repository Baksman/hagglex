import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink('https://hagglex-backend-staging.herokuapp.com/graphql'),
  ),
);

final String getTasksQuery = """
query {
  allTodos {
    id,
    title,
    completed
  }
}
""";

final String register = """
mutation register(\$data:CreateUserInput!) {
  register(data:\$data) {
 UserRo:user{
 username
}
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


// email: String!
// username: String!
// password: String!
// phonenumber: String!
// referralCode: String
// phoneNumberDetails: PhoneNumberDetailsInput
// country: String!
// currency: String!