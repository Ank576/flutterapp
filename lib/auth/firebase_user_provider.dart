import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Ank576FirebaseUser {
  Ank576FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

Ank576FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Ank576FirebaseUser> ank576FirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<Ank576FirebaseUser>((user) => currentUser = Ank576FirebaseUser(user));
