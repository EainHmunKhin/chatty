import 'package:chatty/components/my_button.dart';
import 'package:chatty/components/my_text_field.dart';
import 'package:chatty/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // sign in user
  void SignIn() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailandPassword(
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
                    Icon(
                      Icons.message,
                      size: 100,
                      color: Colors.purple,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //welcome back message
                    Text(
                      "Welcome back you've been missed!",
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
                    // sign in button
                    MyButton(
                      text: "Sign In",
                      onTap: SignIn,
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not a member?'),
                        SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            'Register Now!',
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
