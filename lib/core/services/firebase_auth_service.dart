import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import '../error/exceptions.dart';

/// Authentication service wrapper with error handling
class FirebaseAuthService {
  final FirebaseAuth _auth;

  FirebaseAuthService(this._auth);

  /// Sign in with email and password
  Future<Either<Exception, UserCredential>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(credential);
    } on FirebaseAuthException {
      return Left(ServerException());
    } catch (e) {
      return Left(ServerException());
    }
  }

  /// Sign up with email and password
  Future<Either<Exception, UserCredential>> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(credential);
    } on FirebaseAuthException {
      return Left(ServerException());
    } catch (e) {
      return Left(ServerException());
    }
  }

  /// Sign out
  Future<Either<Exception, void>> signOut() async {
    try {
      await _auth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerException());
    }
  }

  /// Reset password
  Future<Either<Exception, void>> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on FirebaseAuthException {
      return Left(ServerException());
    } catch (e) {
      return Left(ServerException());
    }
  }

  /// Get current user
  User? get currentUser => _auth.currentUser;

  /// Auth state changes stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Check if user is authenticated
  bool get isAuthenticated => currentUser != null;
}
