import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/constant_values.dart';
import 'package:email_validator/email_validator.dart';
import 'package:untitled/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var object=Constants();
  bool canSee=false;

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  SharedPreferences? preferences;

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      preferences = await SharedPreferences.getInstance();
      preferences!.setBool("isLogin", true);

      Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) => const  MyHomePage( ))
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    var mediaHeight=MediaQuery.of(context).size.height;
    var mediaWidth=MediaQuery.of(context).size.width;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:const Color.fromRGBO(245 ,250, 250, 0.8),
      body: Column(
        children: [
          SizedBox(height: mediaHeight*0.1,),
          const Text('facebook',
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(66 ,103, 178, 1),
          ),),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: const Text('Connect with friends and the world arround you on facebook',
             style: TextStyle(
               fontSize: 20,
               color: Colors.black,
             ),
            ),
          ),
          Container(
            height: mediaHeight*0.47,
            width: mediaWidth*0.8,
            margin: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: object.appbarcolor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email id or phone number';
                        }else if(int.tryParse(value)==null) {
                          if (!EmailValidator.validate(value)) {
                            return 'Please enter a valid email';
                          }
                        }
                        else if(int.tryParse(value).toString().length!=10) {
                            return 'Phone number should be 10 characters';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email or phone number',
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          )
                        ),
                      ),
                    ),
                    const Expanded(child:  SizedBox()),
                    TextFormField(
                      controller: passwordController,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }else if(value.length<8){
                          return 'Character must be more than 8';
                        }
                        return null;
                        },
                      obscureText: canSee==true?false:true,
                      decoration:  InputDecoration(
                        hintText: 'Password',
                        isDense: true,
                        suffixIcon: IconButton(
                            onPressed:(){
                             setState(() {
                               canSee==true?canSee=false:canSee=true;
                             });
                            },
                            icon:Icon(canSee==true?Icons.visibility_off:Icons.visibility) ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,

                            )
                        ),
                      ),
                    ),
                    const Expanded(child:  SizedBox()),
                    InkWell(
                      onTap:(){
                        submitForm();
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: object.iconcolor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text('Log in',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                        ),
                      ),
                    ),
                    const Expanded(child:  SizedBox()),
                    Text('Forgot password',
                      style: TextStyle(
                        color: object.iconcolor,
                      ),),
                    const Expanded(child:  SizedBox()),
                    const Divider(thickness: 1,),
                    const Expanded(child:  SizedBox()),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text('Create new account',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                      ),
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
