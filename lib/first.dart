import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/cupertino.dart';
class InstructionPage extends StatefulWidget {
  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.yellow,
                    Colors.pink
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter
              )
          ),


          child: ListView(
            children: <Widget>[

              Shimmer.fromColors(
                  period: Duration(seconds: 5),
                  baseColor: Colors.black,
                  highlightColor: Colors.yellow,

                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                      child: Text("QUIZ GAME",style: TextStyle(
                        fontSize: 30,fontWeight: FontWeight.bold,    decoration: TextDecoration.underline,

                      ), ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("INSTRUCTIONS", textAlign: TextAlign.left,style: TextStyle(
                      fontSize: 30,fontWeight: FontWeight.bold, color:Colors.white
                  ),),
                ),
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.transparent,
                    blurRadius: 20, spreadRadius: 5,
                    offset: Offset(10,10),
                  )
                ]),

                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.fiber_manual_record, color: Colors.white,),
                        Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Answer the questions as fast as possible.", style: TextStyle(
                                color: Colors.white, fontSize: 20
                            ),),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.fiber_manual_record, color: Colors.white,),
                        Container(constraints: BoxConstraints(maxWidth: 300),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("You have 30 seconds to answer the each  question.", style: TextStyle(
                                color: Colors.white,fontSize: 20
                            ),),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.fiber_manual_record, color: Colors.white,),
                        Container(constraints: BoxConstraints(maxWidth: 300),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("You can't switch back once the quiz is started.", style: TextStyle(
                                color: Colors.white,fontSize: 20
                            ),),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.fiber_manual_record, color: Colors.white,),
                        Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Once done, notify your marks on the paper given to u.", style: TextStyle(
                                color: Colors.white,fontSize: 20
                            ),),
                          ),
                        )
                      ],
                    ),


                  ],
                ),
              ),

            ],
          ),
        )


    );
  }
}