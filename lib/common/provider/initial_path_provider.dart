import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final initialPathProvider = Provider<InitialPath>(
  (_) {
    return (delegate) {
      delegate.beamToNamed('/login');
    };
  },
);

typedef InitialPath = void Function(BeamerDelegate delegate);
