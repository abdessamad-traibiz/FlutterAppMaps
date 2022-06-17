import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}
final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
class InitState extends State<SignUp> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) => initWidget();



  Widget initWidget() {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 228, 228),
        body: SingleChildScrollView(
            child: Column(
      children: [
        Column(
          children: [
            
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 130, left: 9),
              child: const Text(
                "créer un compte",
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
            ),
            
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextFormField(
            controller: mailController,
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
            controller: passwordController,
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
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'champ obliagatoire*';
              }
              return null;
            },
            controller: confirmpasswordController,
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
              hintText: 'Confirmer le mot de passe',
            ),
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: checkBoxValue,
              onChanged: (value) {
                setState(() {
                  if (checkBoxValue == true) {
                    checkBoxValue = false;
                  } else {
                    checkBoxValue = true;
                  }
                });
              },
            ),
            SizedBox(
                width: size.width * 0.85,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    "j'accepte les j'accepte les termes et conditions et la politique de confidentialité",
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 44, 44),
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                  ),
                )),
          ],
        ),
        GestureDetector(
          
          onTap:() async{ try {
            if(confirmpasswordController.text==passwordController.text){
              if(checkBoxValue==true){
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: mailController.text.trim(),
    password: passwordController.text.trim(),
  );
  Navigator.pop(context);
  }else {
    //
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content:  Text("il faut accepter les termes"),
      ));
     
  }
  }else{
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content:  Text("Mot de passes non identiques"),));
  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}},
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
              "S'inscrire",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Vous êtes déjà membre ?  "),
              GestureDetector(
                child: const Text(
                  "Connectez-vous maintenant",
                  style: TextStyle(
                    color: Color.fromARGB(255, 87, 117, 202),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        )
      ],
    )));
  }
}