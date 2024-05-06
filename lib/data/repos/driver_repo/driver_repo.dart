import 'package:bus_app/data/models/commint_model/commint_model.dart';
import 'package:bus_app/data/models/driver_model/driver_model.dart';
import 'package:bus_app/error/falur.dart';
import 'package:dartz/dartz.dart';

abstract class DriverRepo {
  Future<DriverModel> fetchOneDriver(String id);
  Future<CommintModel> sendCommit(String id, String commint);
  Future<Either<Failure, List<DriverModel>>> fetchAllRide();
}
