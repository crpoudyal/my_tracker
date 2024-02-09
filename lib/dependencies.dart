import 'package:get_it/get_it.dart';
import 'package:my_tracker/appwrite/appwrite.dart';

void initDependencies() {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton(() => Appwrite());
}
