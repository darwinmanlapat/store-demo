import 'package:beamer/beamer.dart';
import 'package:store_demo/common/route/locations/locations.dart';

final rootLocationBuilder = BeamerLocationBuilder(
  beamLocations: [
    LoginLocation(),
    HomeWrapperLocation(),
  ],
);
