import 'package:chat_box/provider/providers.dart';
import 'package:chat_box/screens/login_screen.dart';
import 'package:chat_box/widgets/signin_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/validation.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<SignUpAuthenticationProvider>(
        builder: (context, signUpProvider, _) {
          return Form(
            key: signUpProvider.signUpFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Icon(
                    Icons.navigate_before,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      const Center(
                        child: Text(
                          'Sign up with Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Get chatting with friends and family today by\n                   signing up for our chat app!',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SignInTextField(
                        text: 'Your Name',
                        onChanged: (value) => signUpProvider.setName(value),
                        validator: (value) => Validation.validateName(value),
                      ),
                      SignInTextField(
                        text: 'Your Email',
                        onChanged: (value) => signUpProvider.setEmail(value),
                        validator: (value) => Validation.validateEmail(value),
                      ),
                      SignInTextField(
                        text: 'Password',
                        onChanged: (value) =>
                            signUpProvider.setFirstPassword(value),
                        validator: (value) =>
                            Validation.validateFirstPassword(value),
                      ),
                      SignInTextField(
                        text: 'Confirm Password',
                        onChanged: (value) =>
                            signUpProvider.setSecondPassword(value),
                        validator: (value) => Validation.validateSecondPassword(
                            value, signUpProvider.firstPassword),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      InkWell(
                        onTap: () {
                          signUpProvider.signUpUser(context);
                        },
                        child: Container(
                          width: 327,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: signUpProvider.isLoading == true
                                ? const CircularProgressIndicator()
                                : const Text(
                                    'Create Account',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
