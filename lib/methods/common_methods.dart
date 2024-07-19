import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CommonMethods {
  // Cette méthode vérifie la connectivité à Internet
  Future<void> checkConnectivity(BuildContext context) async {
    // Vérifie l'état de la connexion
    var connectionResult = await Connectivity().checkConnectivity();
    // Si l'utilisateur n'est pas connecté au réseau mobile ou WiFi
    if (connectionResult != ConnectivityResult.mobile && connectionResult != ConnectivityResult.wifi) {
      // Vérifie si le contexte est toujours valide pour éviter des erreurs
      if (!context.mounted) return;
      // Affiche un SnackBar pour avertir l'utilisateur
      displaySnackBar("Veuillez vérifier votre connexion Internet et réessayer", context);
    }
  }

  // Cette méthode affiche un SnackBar avec le message donné
  void displaySnackBar(String messageText, BuildContext context) {
    var snackBar = SnackBar(content: Text(messageText));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
