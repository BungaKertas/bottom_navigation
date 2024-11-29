// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:pembelajaran_ke_5/home_screen.dart';
import 'package:pembelajaran_ke_5/regis_screen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController txtEmail = TextEditingController(
    text: ""
  );
  final TextEditingController txtPassword = TextEditingController(
    text: ""
  );
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(padding: const EdgeInsets.all(20,
        ),
        child: Column(
          children: [
            const Center(
              child: Text(
                "login screen",
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
              controller: txtEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15,
                  )
                ),
                hintText: "Email",
                labelText: "email",
                contentPadding: const EdgeInsets.all(12,
                )
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: txtPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15,
                  )
                ),
                hintText: "Password",
                labelText: "Password",
                contentPadding: const EdgeInsets.all(12,
                ),
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    obsecureText = !obsecureText;
                  });
                }, 
                icon: Icon(obsecureText ? Icons.visibility_off : Icons.visibility,
                ),
                ),
                ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: obsecureText,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(
                    double.infinity, 
                    40,
                    ),
                ),
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const HomeScreen(), 
                    ),
                    
                  );
                }, child: const Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  "Login", 
              ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(onPressed: (){
                Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const Registerscreen(),),
                  );
              }, child: const Text(
                "Register",
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