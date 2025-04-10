import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Components/loading_widget.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/I18n/translations.dart';
import 'package:idealize_new_version/app_repo.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await AppRepo().localCache.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            fallbackLocale: Locale(
              AppConfig().languages.languageList[0].languageCode,
              AppConfig().languages.languageList[0].countryCode,
            ),
            translations: AppTranslations(),
            debugShowCheckedModeBanner: true,
            theme: AppConfig().themes.light(ratio: 1.0),
            getPages: AppConfig().routes.pages,
            initialRoute: AppConfig().routes.splash,
            builder: (context, child) => LoaderOverlay(
              useDefaultLoading: false,
              overlayWidgetBuilder: (_) => PopScope(
                canPop: false,
                onPopInvoked: (didPop) => true,
                child: const CustomLoadingIndicator(),
              ),
              child: child ?? Container(),
            ),
          )),
    );
  }
}
