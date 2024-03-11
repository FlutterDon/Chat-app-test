import 'package:chattingapp/chatroom.dart';
import 'package:chattingapp/firebase.dart';
import 'package:chattingapp/signup.dart';
import 'package:flutter/material.dart';
class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  var _formkey = GlobalKey<FormState>();
  void _Submit(){
    final isvalid = _formkey.currentState!.validate();
    if(!isvalid){
      return;
    }
    _formkey.currentState!.save();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Container(width: screenWidth, height: screenHeight);
    TextEditingController _emailtext = TextEditingController();
    TextEditingController _Passwordtext = TextEditingController();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    // Image.asset("assets/l.png",width: 200,),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40,right: 40),
                      child: Column(
                        children: [
                          Text("EMAIL ID",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: _emailtext,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              // prefixIcon: Icon(Icons.email),
                              // labelStyle: TextStyle(color: Colors.red),
                              border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                            ),
                            validator: (anyName){
                              if(anyName!.isEmpty||anyName.isNotEmpty){
                                return "Enter Valid Email id";
                              }return null;
                            },
                          ),SizedBox(
                            height: 10,
                          ),Text("PASSWORD",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: _Passwordtext,

                            decoration: InputDecoration(
                                border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)))
                            ),validator: (anyName){
                            if(anyName!.isEmpty||anyName.isNotEmpty){
                              return "Enter Password";
                            }return null;
                          },
                          ),SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: (){
                                                        },
                            child: Text("Foget Password ?"),

                          ),
                          SizedBox(
                            height: 10,
                          ),  ElevatedButton(onPressed: ()async{

                            if(_emailtext.text.isNotEmpty && _Passwordtext.text.isNotEmpty){


                                try{
                                  // await Authendication().chatUser()(_emailtext.text,_Passwordtext.text);
                                  // print("ok");
                                  await Authendication().signinUser(_emailtext.text, _Passwordtext.text).then((value){
                                    print(value);
                                    if(value == "Signin Successfully"){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BottomChatBar()));
                                    }else{
                                      _Submit();
                                    }
                                  });
                                  print("correct");

                                }catch(e){
                                  print(e.toString());
                                }
                            }else{
                              _Submit();
                            }
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatroom()));

                          },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,fixedSize: Size(350, 60)),
                            child:Text("Sign In",style: TextStyle(fontSize: 20,color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                              InkWell(
                                onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                                },
                                child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
