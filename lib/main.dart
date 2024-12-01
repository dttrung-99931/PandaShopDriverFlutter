import 'package:flutter/cupertino.dart';
import 'package:here_panda_map/here_map_options.dart';
import 'package:here_panda_map/here_panda_map_pluggin.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/panda_map_ui_options.dart';
import 'package:panshop_driver/config/app_config.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';

import 'app.dart';

void main() async {
  configDev();
  startApp();
}

Future<void> configDev() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.set(
    apiUrl: 'http://localhost:44444',
    flavor: AppFlavor.dev,
  );
  await PandaMap.initialize(
    plugin: HerePandaMapPluggin(
      options: HerePandaMapOptions(
        mapAPIKey:
            'yourMapAPIKey',
        mapAPIKeyId: 'yourMapAPIKeyId',
      ),
      uiOptions: const MapUIOptions(
        routeColor: AppColors.primary,
        iconColor: AppColors.primary,
      ),
    ),
  );
  throw 'Need config PandaMap'; // Remoe this line when config PandaMap
}
