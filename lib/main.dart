import 'package:flutter/material.dart';

import 'package:templat_project/provider/providers.dart';
import 'package:templat_project/router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/constant.dart';
import 'constants/enviroments.dart';

void main() async {
  await Enviroment.initEnviroment();
  return runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: appName,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      /* theme: appTheme.getTheme(), */
    );
  }
}
