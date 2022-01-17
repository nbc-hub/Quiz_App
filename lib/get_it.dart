import 'package:get_it/get_it.dart';
import 'common/repository/app_repository.dart';
import 'common/services/firebase_auth_service.dart';
import 'common/services/firebase_firestore_service.dart';

GetIt getIt = GetIt.asNewInstance();

void getItSetup() {
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton(() => FirebaseFirestoreService());
  getIt.registerLazySingleton(() => AppRepository());
}
