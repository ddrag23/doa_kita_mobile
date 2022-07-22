import 'package:doa_kita/model/prayer_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class DetailScreenArgument {
  DetailScreenArgument(this.prayer);
  PrayerModel prayer;
}

class DetailPrayerScreen extends ConsumerWidget {
  const DetailPrayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DetailScreenArgument;
    Logger().i(args.prayer);
    return Scaffold(
        appBar: AppBar(
          title: Text(args.prayer.title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Text(
              args.prayer.textArab,
              style: const TextStyle(fontSize: 60),
              textAlign: TextAlign.right,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Text(
              args.prayer.textLatin,
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.right,
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Text(
              args.prayer.translate,
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.right,
            )
          ],
        ));
  }
}
