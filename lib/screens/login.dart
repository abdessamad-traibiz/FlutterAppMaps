
import 'package:appdev/screens/home.dart';
import 'package:appdev/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
final mailController = TextEditingController();
 final passwordController = TextEditingController();
FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: const Color.fromARGB(255, 227, 228, 228),
        body: SingleChildScrollView(
            child: Column(
              
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 150, left: 9),
              child: const Text(
                "Entrez votre email et mot de passe",
                style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 27, 27, 27),
                fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextFormField(
            controller:mailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'champ obliagatoire*';
              }
              return null;
            },
            decoration: InputDecoration(
              fillColor:
                  const Color.fromARGB(255, 248, 248, 248).withOpacity(0.6),
              filled: true,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 214, 23, 23), width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 149, 190, 214), width: 1.0),
                  borderRadius: BorderRadius.circular(6.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 235, 232, 232), width: 1.0),
                  borderRadius: BorderRadius.circular(6.0)),
              hintText: 'Adresse mail',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextFormField(
            controller:passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'champ obliagatoire*';
              }
              return null;
            },
            decoration: InputDecoration(
              fillColor:
                  const Color.fromARGB(255, 248, 248, 248).withOpacity(0.6),
              filled: true,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 214, 23, 23), width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 149, 190, 214), width: 1.0),
                  borderRadius: BorderRadius.circular(6.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 235, 232, 232), width: 1.0),
                  borderRadius: BorderRadius.circular(6.0)),
              hintText: 'Mot de passe',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              // Write Click Listener Code Here
            },
            child: const Text(
              "Mot de passe oublié?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: mailController.text,
    password: passwordController.text
  );
  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Homepage()
              ));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content:  Text("Utilisateur introuvable \t Veuillez S'enregistrer"),));
    
  } else if (e.code == 'wrong-password') {
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content:  Text("Mot de passe incorrect"),));
  }
}
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: const Color.fromARGB(255, 88, 80, 197),
              ),
              color: const Color.fromARGB(255, 88, 80, 197),
              borderRadius: BorderRadius.circular(6.0),

              //borderRadius: BorderRadius.circular(50),
            ),
            child: const Text(
              "Se Connecter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Vous n'avez pas de compte ? "),
              GestureDetector(
                child: const Text(
                  "S'inscrire maintenant",
                  style: TextStyle(
                    color: Color.fromARGB(255, 87, 117, 202),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ));
                },
              )
            ],
          ),
        ),
      ],
    )));
  }
}
