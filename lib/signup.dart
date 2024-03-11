import 'package:chattingapp/firebase.dart';
import 'package:chattingapp/signin.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formkey = GlobalKey<FormState>();
  void _Submit(){
    final isvalid = _formkey.currentState!.validate();
    if(!isvalid){
      return ;
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Container(width: screenWidth, height: screenHeight);
    TextEditingController _email = TextEditingController();
    TextEditingController _Password = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  // Image.asset("assets/l.png",width: 200,),
                  SizedBox(
                    height: 20,
                  ),Container(
                      padding: EdgeInsets.only(left: 40,right: 40),
                      child:Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            Text("USER NAME",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                            TextField(textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)))
                              ),
                            ),SizedBox(
                              height: 19,
                            ),Text("EMAIL ID",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                            TextFormField(textAlign: TextAlign.center,
                              controller: _email,
                              decoration: InputDecoration(
                                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)))
                              ),validator: (error){
                                if(error!.isEmpty||error.isNotEmpty){
                                  return "Enter Valid Email";
                                }return null;
                              },
                            ),SizedBox(
                              height: 19,
                            ),Text("PASSWORD",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                            TextFormField(textAlign: TextAlign.center,
                              validator:(error){
                                if(error!.isEmpty||error.isNotEmpty){
                                  return "Enter Valid Password";
                                }return null;
                              },
                              controller: _Password,
                              decoration: InputDecoration(

                                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)))
                              ),
                            ), SizedBox(
                              height: 19,
                            ),

                            ElevatedButton(onPressed: ()async{
                              if(_email.text.isNotEmpty && _email.text.isNotEmpty)
                               {
                                 await Authendication().registerUser(_email.text,_Password.text);
                               if(_formkey.currentState!.validate()){

                               _Submit();}
                                 if(Authendication().registerUser(_email.text,_Password.text) == "Success"){

                                   Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
                                 }
                                 else{
                                   print("Failed");
                                 }

                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Signin()));
                              }
                            },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,fixedSize: Size(350, 60)),

                              child:Text("Sign Up",style: TextStyle(fontSize: 20,color: Colors.white),
                              ),

                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}
