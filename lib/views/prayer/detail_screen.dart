import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class DetailScreenArgument {
  DetailScreenArgument(this.id);
  int id;
}

class DetailPrayerScreen extends ConsumerWidget {
  const DetailPrayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DetailScreenArgument;
    Logger().i(args.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail doa"),
      ),
      body: const Text('halaman detail'),
    );
  }
}
