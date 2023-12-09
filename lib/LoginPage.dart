import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:myappdev/HomePage.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key : key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSecurePassword = true;

LoginUser(String email, String password) async{
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
     print(credential.user!.email);
     print("Success");
     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
       return HomePage(email:credential.user!.email);}));
  } on FirebaseAuthException catch (e) {
    print("Wrong password provided for the user");
    print(e.code);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(195, 224, 229, 1),
        leading: BackButton(),
        title: const Text('Authentication'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(195, 224, 229, 1),
          ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 550,),
          child: 
            Lottie.asset('assets/Authentication.json', width: 200, height: 200,),
        ),  
        ),
          Padding(
            padding: const EdgeInsets.only(top:200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                      label: Text("Email",style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Color(0xffC3E0E5)
                      ),),
                    ),
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: _isSecurePassword,
                      decoration: InputDecoration(
                      suffixIcon: togglePassword(),
                      label: const Text("Password",style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Color(0xffC3E0E5),
                      ),),
                    ),
                    ),
                    const SizedBox(height: 50,),
                    ElevatedButton.icon(onPressed: ()async{
                      LoginUser(_emailController.text, _passwordController.text);
                    },
                    icon: const Icon(Icons.arrow_right), 
                    label: const Text("Login", style: TextStyle(fontSize: 30, color: Color(0xffC3E0E5),),)),
                  ],
                ),
              ),
              ),
          ),
        ],
      )
    );
  }
  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword = !_isSecurePassword;
      });
    }, icon: _isSecurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
    color: Colors.grey);
  }
}  