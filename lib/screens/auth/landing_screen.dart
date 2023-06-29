import 'package:cyberwatch_mobile/screens/auth/signup_screen.dart';
import 'package:cyberwatch_mobile/screens/home_screen.dart';
import 'package:cyberwatch_mobile/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/text_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primary,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextBold(text: 'Cyberwatch', fontSize: 32, color: Colors.white),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text: 'Philippine National Police - Cagayan De Oro City',
                    fontSize: 12,
                    color: Colors.white),
                const SizedBox(
                  height: 30,
                ),
                TextFieldWidget(
                    label: 'Username', controller: usernameController),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                    isObscure: true,
                    label: 'Password',
                    controller: passwordController),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minWidth: 250,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                  child: TextBold(text: 'LOGIN', fontSize: 18, color: primary),
                ),
                const SizedBox(
                  height: 20,
                ),

                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SignupScreen()));
                  },
                  child: TextBold(
                      text: 'Create Account',
                      fontSize: 14,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     border: Border.all(color: Colors.white),
                //   ),
                //   child: MaterialButton(
                //       height: 50,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       minWidth: 250,
                //       onPressed: () {
                //         // Navigator.of(context).push(MaterialPageRoute(
                //         //     builder: (context) => const LoginPage()));
                //       },
                //       child: TextBold(
                //           text: 'CONTINUE AS ADMIN',
                //           fontSize: 12,
                //           color: Colors.white)),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
