import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pembelajaran_ke_5/cubit/auth_cubit.dart';
import 'package:pembelajaran_ke_5/login_screen.dart';

 
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
 
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}
 
class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthInitial) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (
                      context,
                    ) =>
                        const Loginscreen(),
                  ),
                  (route) => false,
                );
              } else if (state is AuthFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "state.e,"
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                    175,
                    40,
                  ),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  context.read<AuthCubit>().signOut();
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              );
            },
          ),
          Container(),
        ],
      ),
    );
  }
}
 