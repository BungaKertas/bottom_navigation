import 'package:flutter/material.dart';
import 'package:pembelajaran_ke_5/cubit/auth_cubit.dart';
import 'package:pembelajaran_ke_5/firebase_options.dart';
import 'package:pembelajaran_ke_5/splash_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main () async { runApp(
  const MainActivity(),
);
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MainActivity extends StatelessWidget {
  const MainActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(),),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        
      ),
    );
  }
}
