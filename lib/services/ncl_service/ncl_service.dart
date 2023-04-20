import 'dart:convert' as convert;

import 'package:dartz/dartz.dart';
import 'package:ncl_assessment/models/ship_information_error.dart';
import 'package:ncl_assessment/models/ship_model.dart';
import 'package:ncl_assessment/models/ship_name_enum.dart';
import 'package:ncl_assessment/services/http_service/http_service_interface.dart';
import 'package:ncl_assessment/services/ncl_service/ncl_service_interface.dart';

class NCLService extends NCLServiceInterface {
  NCLService(this.httpService);

  final HTTPServiceInterface httpService;

  /// Also inject the local database service

  @override
  Future<Either<ShipModel, ShipInformationError>> fetchShipModelFromServer(
    ShipName shipName,
  ) async {
    var url = Uri.https(
      'www.ncl.com',
      '/cms-service/cruise-ships/${shipName.apiRequestTitle}',
    );

    try {
      var response = await httpService.get(url);
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        final model = ShipModel.fromJson(jsonResponse);
        storeShipModelLocally(shipName, model);
        return Left(model);
      } else {
        throw Exception();
      }
    } catch (e) {
      return Right(
        ShipInformationError(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<ShipModel?, ShipInformationError>> fetchShipModelFromLocalDB(
      ShipName shipName) async {
    return Right(
      ShipInformationError(
        "local database does not contain ${shipName.displayTitle}'s information locally",
      ),
    );
  }

  @override
  Future<void> storeShipModelLocally(
      ShipName shipName, ShipModel shipModel) async {
    // TODO: implement storeShipModelLocally
    //     - I believe I would just ignore errors instead of try to explain to user
  }
}
