import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../auth/auth_error.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  LoginBloc()
      : super(
          const LoginStateLoggedOut(
            isLoading: false,
          ),
        ) {
    // handle logout event

    on<LoginEventLogOut>(
      (event, emit) async {
        // start loading
        // emit(
        //   const LoginStateIsInLoginView(
        //     isLoading: true,
        //   ),
        // );
        emit(const Load(isLoading: true));
        // log the user out
        await FirebaseAuth.instance.signOut();
        // log the user out in the UI as well
        emit(
          const LoginStateIsInLoginView(
            isLoading: false,
          ),
        );
      },
    );

    // handle Login initialize event

    on<LoginEventInitialize>(
      (event, emit) async {
        // get the current user
        final user = FirebaseAuth.instance.currentUser;
        var name;
        if (user == null) {
          // the user in logged out
          emit(
            const LoginStateIsInOnBoardingView(
              isLoading: false,
            ),
          );
        } else {
          // log the user in
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(user.uid)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              name = (documentSnapshot.data() as dynamic)["name"];
              emit(
                LoginStateLoggedIn(
                  isLoading: false,
                  name: name,
                ),
              );
            }
          });
        }
      },
    );

    // handle register event

    on<LoginEventRegister>(
      (event, emit) async {
        // start loading
        // emit(
        //   const LoginStateIsInRegistrationView(
        //     isLoading: true,
        //   ),
        // );
        emit(const Load(isLoading: true));
        final email = event.email;
        final password = event.password;
        final name = event.name;
        try {
          // create the user
          final credentials =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          final String user = credentials.user!.uid;
          debugPrint(user);
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(user)
              .set({'name': name});

          emit(
            LoginStateLoggedIn(
              isLoading: false,
              name: name,
            ),
          );
        } on FirebaseAuthException catch (e) {
          emit(
            LoginStateIsInRegistrationView(
              isLoading: false,
              authError: AuthError.from(e),
            ),
          );
        }
      },
    );

    // handle going to login screen

    on<LoginEventGoToLogin>(
      (event, emit) {
        emit(
          const LoginStateIsInLoginView(
            isLoading: false,
          ),
        );
      },
    );

    // handle going to register screen

    on<LoginEventGoToRegistration>(
      (event, emit) {
        emit(
          const LoginStateIsInRegistrationView(
            isLoading: false,
          ),
        );
      },
    );

    // hanlde logging in event

    on<LoginEventLogIn>(
      (event, emit) async {
        // emit(
        //   const LoginStateIsInLoginView(
        //     isLoading: true,
        //   ),
        // );
        emit(const Load(isLoading: true));
        // log the user in
        try {
          final email = event.email;
          final password = event.password;
          var name;
          final userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          final user = userCredential.user!;
          FirebaseFirestore.instance
              .collection('Users')
              .doc(user.uid)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              name = (documentSnapshot.data() as dynamic)["name"];
            }
          });
          emit(
            LoginStateLoggedIn(
              isLoading: false,
              name: name,
            ),
          );
        } on FirebaseAuthException catch (e) {
          emit(
            LoginStateIsInLoginView(
              isLoading: false,
              authError: AuthError.from(e),
            ),
          );
        }
      },
    );

    on<LoginEventGoToOnBoarding>(
      (event, emit) {
        emit(
          const LoginStateIsInOnBoardingView(isLoading: false),
        );
      },
    );
  }
}
