// import 'dart:developer';

// import 'package:bus_app/data/models/commint_model/commint_model.dart';
// import 'package:bus_app/data/repos/commint_repo/commint_repo.dart';
// import 'package:bus_app/error/falur.dart';
// import 'package:bus_app/shared/api_serves.dart';
// import 'package:bus_app/shared/const.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// class CommintRepoImplemntion extends CommentRepo {
//   final ApiServes apiServes;
//   CommintRepoImplemntion(this.apiServes);

//   @override
//   Future<Either<Failure, CommintModel>> sendCommit(
//       String id, String commint) async {
//     try {
//       String endpoint = "review/createone/$id";

//       Map<String, dynamic> headerRequst = {
//         'Cookie': token,
//       };
//       var data =
//           await apiServes.post(endpoint: endpoint, headerRequst: headerRequst);

//       CommintModel commintData = CommintModel.fromJson(data["data"]);

//       return right(commintData);
//     } on Exception catch (e) {
//       if (e is DioException) {
//         // log(e.toString());
//         return left(ServerFailuar.fromDioError(e)); //! return
//       } else {
//         // log(e.toString());
//         return left(ServerFailuar(e.toString())); //! return
//       }
//     }
//   }
// }
