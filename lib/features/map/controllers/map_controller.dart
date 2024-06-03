import 'package:panda_map/core/controllers/panda_map_controller_factory.dart';
import 'package:panda_map/panda_map.dart';

import '../../../core/base/base_controller.dart';

class MapController extends BaseController {
  final pandaMapController = PandaMapControllerFactory.getController(PandaMap.options.mapType);
}
