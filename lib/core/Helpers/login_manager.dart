



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/main.dart';


bool changeLoginState(var ref) {
  return ref.watch(isUserLoggedInProvider.notifier).update((state) => !state);
}
