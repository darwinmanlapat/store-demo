import 'package:beamer/beamer.dart';
import 'package:store_demo/common/route/locations/locations.dart';

final homeLocationBuilder = BeamerLocationBuilder(
  beamLocations: [
    HomeLocation(),
    CartLocation(),
  ],
);
