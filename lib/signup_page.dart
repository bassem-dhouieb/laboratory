import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List images = [
      "f.png",
      "g.png",
      "t.png",
    ];
    Color color1 = Color(0xff76A371);
    Color color2 = Color(0xff000000);
    double w = MediaQuery.of(context).size.width; //get the width of the screen
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: w,
                height: h*0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "img/signup.png"
                        ),
                        fit:BoxFit.cover
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: h*0.1,),
                    CircleAvatar(
                      backgroundColor: Colors.white38,
                      radius: 40,
                      backgroundImage: AssetImage(
                        "img/profile.png"
                      ),
                    )
                  ],
                ),
              ),

              Container(
                  width: w,
                  margin: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(1,1),
                                color: Colors.grey.withOpacity(0.4),
                              )
                            ]
                        ),
                        child: TextField(

                          decoration: InputDecoration(
                            hintText: "Email",
                              prefixIcon: Icon(Icons.email,color:color2.withOpacity(0.8)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(1,1),
                                color: Colors.grey.withOpacity(0.4),
                              )
                            ]
                        ),
                        child: TextField(

                          decoration: InputDecoration(
                              hintText: "Full Name",
                              prefixIcon: Icon(Icons.person,color:color2.withOpacity(0.8)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(1,1),
                                color: Colors.grey.withOpacity(0.4),
                              )
                            ]
                        ),
                        child: TextField(

                          decoration: InputDecoration(
                              hintText: "Phone",
                              prefixIcon: Icon(Icons.phone,color:color2.withOpacity(0.8)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(1,1),
                                color: Colors.grey.withOpacity(0.4),
                              )
                            ]
                        ),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.password_outlined,color:color2.withOpacity(0.8)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)
                              )
                          ),
                        ),
                      ),

                    ],
                  )
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){

                }
                ,child: Container(
                  width: w*0.5,
                  height: h*0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(
                              "img/loginbtn.png"
                          ),
                          fit:BoxFit.cover
                      )
                  ),
                  child:  Center(
                    child: Text("Sign up",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              RichText(text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                text: "Have an account?",
                style: TextStyle(
                  fontSize: 20,
                  color:Color(0xffA43464),
                )
              )),
              SizedBox(height: w*0.05,),
              RichText(text: TextSpan(
                  text: "Contact us via social network",
                  style: TextStyle(
                    color: color2,
                    fontSize: 16,
                  ),
              )),
              Wrap(
                children: List<Widget>.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 27,
                      backgroundColor: Color(0xffA43464).withOpacity(0.8),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          "img/"+images[index]
                        ),
                      ),
                    ),
                  );
                }
                ),
              )
            ],
          ),
        )
    );
  }
}
