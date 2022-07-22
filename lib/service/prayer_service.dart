import 'package:dio/dio.dart';
import 'package:doa_kita/common/http_client.dart';
import 'package:doa_kita/model/prayer_model.dart';
import 'package:logger/logger.dart';

class PrayerService {
  final _client = HttpClient.withOption();

  Future<List<PrayerModel>> getAllPrayer() async {
    Response response = await _client.get('/prayer');
    List<PrayerModel> items = [];
    response.data['data'].forEach((item) {
      items.add(PrayerModel.fromMap(item));
    });
    Logger().i(items);

    return items;
  }

  Future<PrayerModel> showPrayer(int id) async {
    Response response = await _client.get('/prayer/$id');
    return PrayerModel.fromMap(response.data['data']);
  }
}
