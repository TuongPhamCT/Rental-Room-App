import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:rental_room_app/themes/color_palete.dart';
import 'package:rental_room_app/themes/text_styles.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  bool firstEnterEmailTF = false;

  final passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  bool firstEnterPasswordTF = false;

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            reverse: true,
            child: Center(
              child: Container(
                color: ColorPalette.backgroundColor,
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(100),
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset(
                        'assets/images/login_logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Gap(40),
                    Text(
                      "LOGIN",
                      style: TextStyles.h1.copyWith(
                          fontFamily: GoogleFonts.ntr().fontFamily,
                          color: ColorPalette.darkBlueText),
                    ),
                    const Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextField(
                        controller: emailController,
                        focusNode: emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        onTap: () => {firstEnterEmailTF = true},
                        style: TextStyles.h6,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyles.h5.copyWith(
                              fontFamily: GoogleFonts.ntr().fontFamily,
                              color: ColorPalette.detailBorder),
                          prefixIcon: const Icon(IconlyLight.profile),
                          prefixIconColor: ColorPalette.detailBorder,
                          helperText: "",
                        ),
                        obscureText: false,
                      ),
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextField(
                        controller: passwordController,
                        focusNode: passwordFocus,
                        onTap: () => {firstEnterPasswordTF = true},
                        style: TextStyles.h6,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyles.h5.copyWith(
                                fontFamily: GoogleFonts.ntr().fontFamily,
                                color: ColorPalette.detailBorder),
                            prefixIcon: const Icon(IconlyLight.lock),
                            prefixIconColor: ColorPalette.detailBorder,
                            helperText: ""),
                        obscureText: true,
                        obscuringCharacter: '*',
                      ),
                    ),
                    Row(
                      children: [
                        const Gap(35),
                        Checkbox(
                          value: _isChecked,
                          onChanged: (value) =>
                              setState(() => _isChecked = value!),
                          checkColor: ColorPalette.backgroundColor,
                          side: const BorderSide(
                              width: 2, color: ColorPalette.primaryColor),
                          activeColor: ColorPalette.primaryColor,
                        ),
                        Text(
                          'Remember me',
                          style: TextStyles.h6.copyWith(
                              fontStyle: FontStyle.italic,
                              color: ColorPalette.primaryColor),
                        ),
                      ],
                    ),
                    const Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 38),
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: login handle
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPalette.primaryColor,
                          foregroundColor: ColorPalette.blackText,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 80),
                          child: Text(
                            'LOG IN',
                            style: TextStyles.h4.copyWith(
                                fontFamily: GoogleFonts.ntr().fontFamily),
                          ),
                        ),
                      ),
                    ),
                    const Gap(30),
                    RichText(
                      text: TextSpan(style: TextStyles.h6, children: <TextSpan>[
                        TextSpan(
                            text: "Don't have account?       ",
                            style: TextStyles.h5.copyWith(
                                fontFamily: GoogleFonts.ntr().fontFamily)),
                        TextSpan(
                            text: "Register Now!",
                            style: TextStyles.h5.copyWith(
                                fontFamily: GoogleFonts.ntr().fontFamily,
                                color: ColorPalette.greenText),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //TODO: Handle Sign up screen
                                // GoRouter.of(context).go('/signup');
                              })
                      ]),
                    ),
                    const Gap(20),
                    RichText(
                        text: TextSpan(
                            text: "Forgot password?",
                            style: TextStyles.h5.copyWith(
                                fontFamily: GoogleFonts.ntr().fontFamily,
                                color: ColorPalette.greenText),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //TODO: Handle forgot password screen
                                // GoRouter.of(context).go('/signup');
                              })),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
