import 'package:doa_kita/provider/prayer_provider.dart';
import 'package:doa_kita/views/prayer/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class HomeScreen extends ConsumerWidget {
  final String? title;
  const HomeScreen({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(prayerProvider.notifier).readAllPrayer();
    // ignore: invalid_use_of_protected_member
    final data = ref.watch(prayerProvider.notifier).state;
    // Logger().d(data);
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView(children: [
        for (final item in data)
          Card(
            child: InkWell(
              focusColor: Colors.blue,
              onTap: () {
                Logger().i("oke");
                Navigator.pushNamed(context, '/detail',
                    arguments: DetailScreenArgument(item.id));
              },
              child: ListTile(
                title: Text(item.title),
                subtitle: Text(item.deskripsi ?? '-'),
              ),
            ),
          )
      ]),
    );
  }
}
