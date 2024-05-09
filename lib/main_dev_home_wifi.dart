import 'package:panshop_driver/config/app_config.dart';

import 'app.dart';

void main() async {
  configDev();
  startApp();
}

void configDev() {
  AppConfig.set(
    apiUrl: 'https://192.168.1.31:5001',
    flavor: AppFlavor.dev,
  );
}
