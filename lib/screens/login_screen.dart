import 'package:chat_box/constants/validation.dart';
import 'package:chat_box/provider/providers.dart';
import 'package:chat_box/widgets/signin_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LogInAuthenticationProvider>(
      builder: (context , logInProvider , _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: logInProvider.logInFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    const Center(
                      child: Text(
                        'Log In To Chat Box',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      'Welcome back! Sign in using your social\n       account or email to continue us',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SignInTextField(text: 'Your Email' , validator: (value) => Validation.validateEmail(value) , onChanged: (value) => logInProvider.setEmail(value) ,),
                    const SizedBox(
                      height: 30,
                    ),
                     SignInTextField(text: 'Password' , validator: (value) => Validation.validateFirstPassword(value), onChanged: (value) => logInProvider.setPassWord(value),),
                    const SizedBox(
                      height: 200,
                    ),
                    InkWell(
                      onTap: () async{
                        await logInProvider.logInUser(context);
                      },
                      child: Container(
                        width: 327,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:  Center(
                          child:
                          logInProvider.isLoading == true ? const CircularProgressIndicator() :const Text(
                            'Log In',
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
                    const Text('Forgot Password?' , style: TextStyle(color: Colors.green),)
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
