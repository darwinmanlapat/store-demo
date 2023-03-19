import 'package:hooks_riverpod/hooks_riverpod.dart';

final staticItemProvider =
    StateNotifierProvider<StaticItemNotifier, int>((ref) {
  return StaticItemNotifier();
});

class StaticItemNotifier extends StateNotifier<int> {
  StaticItemNotifier({int? state}) : super(state ?? 2);

  void onChanged(int number) => state = number;

  void reset() => state = 2;
}
