// import 'package:dartz/dartz.dart';
// import 'package:store/Core/Api/api_consumer.dart';
// import 'package:store/Core/Api/end_ponits.dart';
// import 'package:store/Models/log_in_model.dart';
// import 'package:store/Repo/login_repo.dart';

// class LogInRepoImpl extends LoginRepo {
//   final ApiConsumer api;

//   LogInRepoImpl({required this.api});
//   @override
//   Future<Either<String, LogInModel>> logIn({required String email, required String passward}) async{
//     try {
//       final response = await api.post(
//         EndPonits.signIn,
//         data: {
//           ApiKey.email : email,
//           ApiKey.password : passward,
//         },
//       );
//       final user = LogInModel.fromJson(response);
//     }
//   }

// }
