import 'package:chatty/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  //  sign up user
  void SignUp() async {
    if (passwordController.text != confirmpasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match!")),
      );
      return;
    }
    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 231, 240),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    //logo
                    const Icon(
                      Icons.message,
                      size: 100,
                      color: Colors.purple,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //welcome back message
                    Text(
                      "Let's get create an account for you",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //email textfield
                    MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obsucreText: false),
                    const SizedBox(
                      height: 10,
                    ),
                    //password textfield
                    MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obsucreText: true),
                    const SizedBox(
                      height: 25,
                    ),
                    MyTextField(
                        controller: confirmpasswordController,
                        hintText: 'Password',
                        obsucreText: true),
                    const SizedBox(
                      height: 25,
                    ),
                    // sign in button
                    MyButton(
                      text: "Sign Up",
                      onTap: SignUp,
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    GestureDetector(
                      onTap: widget.onTap,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already a member?'),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Login Now!',
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
