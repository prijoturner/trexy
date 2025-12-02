import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'core/services/google_auth_service.dart';
import 'core/services/firebase_auth_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features

  // Core - Services
  sl.registerLazySingleton<GoogleAuthService>(
    () => GoogleAuthService(sl(), sl()),
  );
  sl.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(sl()),
  );

  // External
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
}
