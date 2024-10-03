import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/network/network_api_services.dart';


class BookSlotRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> fetchBookingSlotAPIRepo(
      {String? date, int? chargerPoint, int? connector}) async {
    Map<String, dynamic> params = {
      'date': date,
      'chargerpoint': chargerPoint,
      'connector': connector,
    };
    final response = await _apiService.post(
      url: APIs.bookedTimeslots,
      request: params,
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> postBookingSlotAPIRepo({
    String? day,
    int? chargerPoint,
    int? connector,
    List<String>? timeSlots,
    List<String>? times,
    int? customerId,
  }) async {
    Map<String, dynamic> params = {
      'chargerpoint_id': chargerPoint,
      'connector_id': connector,
      'day': day,
      'timeslots': timeSlots,
      'times': times,
      'customer_id': customerId,
    };

    try {
      final response = await _apiService.post(
        url: APIs.bookingSlotAPI,
        request: params,
        isTokenRequired: true,
      );

      return response;
    } catch (error) {
      // Handle the error
      print(error.toString());
      rethrow;
    }
  }

  Future<dynamic> fetchSlotBookedAPIRepo({int? customerId}) async {
    Map<String, dynamic> params = {
      'customer_id': customerId,
    };
    final response = await _apiService.post(
      url: APIs.bookedSlotDetailsAPI,
      request: params,
      isTokenRequired: true,
    );
    return response;
  }
}
