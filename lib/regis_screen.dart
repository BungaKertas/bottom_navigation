import 'package:flutter/material.dart';
import 'package:pembelajaran_ke_5/cubit/auth_cubit.dart';
import 'package:pembelajaran_ke_5/home_screen.dart';
import 'package:pembelajaran_ke_5/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final TextEditingController txtpassword = TextEditingController(text: "");
  final TextEditingController txtnama = TextEditingController(text: "");
  final TextEditingController txtemail = TextEditingController(text: "");
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Register Screen",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: txtnama,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                      15,
                    )),
                    hintText: "nama",
                    labelText: "nama",
                    contentPadding: const EdgeInsets.all(
                      12,
                    )),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: txtemail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                      15,
                    )),
                    hintText: "email",
                    labelText: "email",
                    contentPadding: const EdgeInsets.all(
                      12,
                    )),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: txtpassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  hintText: "Password",
                  labelText: "Password",
                  contentPadding: const EdgeInsets.all(
                    12,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecureText = !obsecureText;
                      });
                    },
                    icon: Icon(
                      obsecureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: obsecureText,
              ),
              const SizedBox(
                height: 50,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSucces) {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen(),), (route) => false);
                  } else if (state is AuthFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Maaf Password dan Username salah"), 
                    backgroundColor: Colors.red,
                    ));
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
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(
                        double.infinity,
                        40,
                      ),
                    ),
                    onPressed: () {
                     context.read <AuthCubit>().signUp(name: txtnama.text, email: txtemail.text, password: txtpassword.text);
                    },
                    child: const Text(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      "Registrasi",
                    ),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Loginscreen(),
                      ));
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
