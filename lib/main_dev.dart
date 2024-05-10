import 'package:panshop_driver/config/app_config.dart';

import 'app.dart';

void main() async {
  configDev();
  startApp();
}

void configDev() {
  AppConfig.set(
    apiUrl: 'http://localhost:44444',
    flavor: AppFlavor.dev,
  );
}
