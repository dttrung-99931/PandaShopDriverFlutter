import 'package:flutter/material.dart';
import 'package:here_panda_map/here_map_options.dart';
import 'package:here_panda_map/here_panda_map_pluggin.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panshop_driver/config/app_config.dart';

import 'app.dart';

void main() async {
  await configDev();
  startApp();
}

Future<void> configDev() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.set(
    apiUrl: 'https://192.168.1.31:5001',
    flavor: AppFlavor.dev,
  );
  await PandaMap.initialize(
    plugin: HerePandaMapPluggin(
      options: HerePandaMapOptions(
        mapAPIKey:
            'bb6rs_Rbb7Vz0qOXSaF_CnVL7Z3rJ53N4uJ8-fUjEM-TBSGPU6hUsWxAocMuZ1cB57oJ_v8QaXpdWEmKVCgNFg',
        mapAPIKeyId: 'GWunhRPgdFdBJcKsfrCaqg',
      ),
    ),
  );
}
