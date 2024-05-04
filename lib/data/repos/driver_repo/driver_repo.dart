import 'package:bus_app/data/models/driver_model/driver_model.dart';
import 'package:bus_app/error/falur.dart';
import 'package:dartz/dartz.dart';

abstract class DriverRepo {
  Future<Either<Failure, DriverModel>> fetchOneDriver(String id);
}
