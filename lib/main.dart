import 'package:panshop_driver/config/app_config.dart';

import 'app.dart';

void main() async {
  configDev();
  startApp();
}

void configDev() {
  // TODO
  AppConfig.set(
    apiUrl: '',
    flavor: AppFlavor.production,
  );
}
