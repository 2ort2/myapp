import 'package:flutter/material.dart';
import '../methods/common_methods.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _State();
}

class _State extends State<SignUpScreen> {
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  // Vérifie la présence de l'internet
  checkIfNetworkIsAvailable() {
    cMethods.checkConnectivity(context);
    signUpFormValidation();
  }

  signUpFormValidation() {
    if (usernameTextEditingController.text.trim().isEmpty) {
      cMethods.displaySnackBar("Le champ du nom d'utilisateur ne peut pas être vide.", context);
    } else if (usernameTextEditingController.text.trim().length < 3) {
      cMethods.displaySnackBar("Votre nom doit comporter au moins 4 caractères.", context);
    } else if (phoneTextEditingController.text.trim().isEmpty) {
      cMethods.displaySnackBar("Le champ du numéro de téléphone ne peut pas être vide.", context);
    } else if (phoneTextEditingController.text.trim().length < 7) {
      cMethods.displaySnackBar("Votre numéro de téléphone doit comporter au moins 8 caractères.", context);
    } else if (emailTextEditingController.text.trim().isEmpty) {
      cMethods.displaySnackBar("Le champ de l'email ne peut pas être vide.", context);
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailTextEditingController.text.trim())) {
      cMethods.displaySnackBar("Votre email est invalide.", context);
    } else if (passwordTextEditingController.text.trim().isEmpty) {
      cMethods.displaySnackBar("Le champ du mot de passe ne peut pas être vide.", context);
    } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$').hasMatch(passwordTextEditingController.text.trim())) {
      cMethods.displaySnackBar("Votre mot de passe doit comporter au moins 8 caractères, dont une lettre majuscule, une lettre minuscule, un chiffre et un caractère spécial.", context);
    } else {
      // register user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset("assets/images/city.jpg"),
              const Text(
                "Inscription",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text fields = button
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    TextField(
                      controller: usernameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Nom d'utilisateur",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 22),
                    TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Téléphone",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 22),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Votre email",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 22),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Mot de passe",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        checkIfNetworkIsAvailable();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 15)),
                      child: const Text("S'inscrire"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Text button
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => const LoginScreen()));
                },
                child: const Text(
                  "Vous avez déjà un compte? Se Connecter",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
