import 'package:dartz/dartz.dart';
import 'package:ncl_assessment/models/ship_information_error.dart';
import 'package:ncl_assessment/models/ship_model.dart';
import 'package:ncl_assessment/models/ship_name_enum.dart';

abstract class NCLServiceInterface {
  Future<Either<ShipModel, ShipInformationError>> fetchShipModelFromServer(
    ShipName shipName,
  );

  Future<Either<ShipModel?, ShipInformationError>> fetchShipModelFromLocalDB(
    ShipName shipName,
  );

  Future<void> storeShipModelLocally(
    ShipName shipName,
    ShipModel shipModel,
  );
}
