import 'package:panda_map/panda_map.dart';
import 'package:panda_map/panda_map_options.dart';
import 'package:panshop_driver/config/app_config.dart';

import 'app.dart';

void main() async {
  await configDev();
  startApp();
}

Future<void> configDev() async {
  AppConfig.set(
    apiUrl: 'http://localhost:44444',
    flavor: AppFlavor.dev,
  );
  await PandaMap.init(
    // Here map
    options: MapOptions(
      mapAPIKey: 'bb6rs_Rbb7Vz0qOXSaF_CnVL7Z3rJ53N4uJ8-fUjEM-TBSGPU6hUsWxAocMuZ1cB57oJ_v8QaXpdWEmKVCgNFg',
      mapAPIKeyId: 'GWunhRPgdFdBJcKsfrCaqg',
      mapType: PandaMapType.heremap,
    ),
  );
}
