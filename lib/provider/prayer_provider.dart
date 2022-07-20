import 'package:doa_kita/model/prayer_model.dart';
import 'package:doa_kita/service/prayer_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final prayerService = Provider((_) => PrayerService());

final prayerProvider =
    StateNotifierProvider<PrayerProvider, List<PrayerModel>>((ref) {
  final serviceData = ref.read(prayerService);
  return PrayerProvider(serviceData);
});

class PrayerProvider extends StateNotifier<List<PrayerModel>> {
  PrayerProvider(this._serviceData, [List<PrayerModel>? state]) : super(state ?? []);
  final PrayerService? _serviceData;

  Future<void> readAllPrayer() async{
    try {
      List<PrayerModel> response = await _serviceData!.getAllPrayer();
      Logger(printer: PrettyPrinter()).d(response);
        state = response;
    } catch (e) {
      Logger(printer: PrettyPrinter()).d(e);

    }
  }
}
