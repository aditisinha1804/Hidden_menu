import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

import 'package:wave/config.dart';import 'package:wave/wave.dart';

import 'package:auto_size_text/auto_size_text.dart';
class FeedBackPage extends StatefulWidget {
  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}


class _FeedBackPageState extends State<FeedBackPage> with TickerProviderStateMixin {
  double _value = 2;
  bool enableBtn =
  true; // Prevents user from frequently switching between feedback types without saving anything. With the help of timer, it produces a 1 second delay between switching.
  bool reviewSubmitted = false;
  bool sugSubmitted = false;
  bool loggedIn = false;
  bool internet = true;
  bool reportSubmitted = false;
  TextEditingController feedBackText = TextEditingController();
  bool showSlider = true;
  int _state = 0;
  int selectedFeedback;
  bool validate = false;
  int highlight;
  MediaQueryData data;
  Animation _animation;
  String hint = "Please select a feedback category from above";
  AnimationController _controller;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.maxFinite;

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: ListView(
            children: <Widget>[
              Stack(
                  children: <Widget>[
                    Container(
                      height: 650,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: WaveWidget(
                          config: CustomConfig(
                            gradients: [
                              [Colors.deepPurple ,Color(0xEEF44336)],
                              [Colors.yellow, Color(0x77E57373)],
                              [Colors.pink, Color(0x66FF9800)],
                              [Colors.yellow, Color(0x55FFEB3B)]
                            ],
                            durations: [19440, 10800],
                            heightPercentages: [0.20, 0.25],
                            blur: MaskFilter.blur(BlurStyle.solid, 10),
                            gradientBegin: Alignment.bottomLeft,
                            gradientEnd: Alignment.topRight,
                          ),
                          waveAmplitude: 0,
                          size: Size(
                            double.infinity,
                            double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Container(

                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Container(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 4, 4, 4),
                                  child: Container(

                                    child: AutoSizeText(
                                      "What is your opinion of this app ?",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),
                              RatingBar(
                                initialRating: 3,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 12, 8, 12),
                                child: Container(

                                  child: AutoSizeText(
                                    "Please select a category below to enable feedback",
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal),
                                  ),
                                ),
                              ),Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      RaisedButton(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                              alignment: Alignment.center,

                                              child: AutoSizeText(
                                                'Review',
                                                maxLines: 1,
                                                style: TextStyle(fontSize: 16),
                                                minFontSize: 4,
                                                maxFontSize: 20,
                                              )),
                                        ),
                                        textColor: Colors.black,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(30.0),
                                        ),
                                        color: highlight == 0
                                            ? Colors.orange.shade400
                                            : Colors.grey.shade200,
                                        onPressed: () {
                                          if (!reviewSubmitted && enableBtn) {
                                            setState(() {
                                              _state = 0;
                                              hint = "Your opinion matters to us.";
                                              highlight = 0;
                                              _width = double.maxFinite;
                                              feedBackText.clear();
                                              showSlider = false;
                                              selectedFeedback = 1;
                                            });
                                          }
                                        },
                                      ),
                                      RaisedButton(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(5, 3, 0, 5),
                                            child: Container(
                                                alignment: Alignment.center,

                                                child: AutoSizeText(
                                                  'Suggestions',
                                                  maxLines: 1,
                                                  style: TextStyle(fontSize: 16),
                                                  minFontSize: 4,
                                                  maxFontSize: 20,
                                                )),
                                          ),
                                          textColor: Colors.black,
                                          shape: new RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(30.0),
                                          ),
                                          color: highlight == 1
                                              ? Colors.orange.shade400
                                              : Colors.grey.shade200,
                                          onPressed: () {
                                            if (!sugSubmitted && enableBtn) {
                                              setState(() {
                                                _width = double.maxFinite;
                                                _state = 0;
                                                feedBackText.clear();
                                                showSlider = false;
                                                hint = "We value your suggestions.";
                                                selectedFeedback = 2;
                                                highlight = 1;
                                              });
                                            }
                                          }),
                                      RaisedButton(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                              alignment: Alignment.center,

                                              child: AutoSizeText(
                                                'Report',
                                                maxLines: 1,
                                                style: TextStyle(fontSize: 16),
                                                minFontSize: 4,
                                                maxFontSize: 20,
                                              )),
                                        ),
                                        textColor: Colors.black,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(30.0),
                                        ),
                                        color: highlight == 2
                                            ? Colors.orange.shade400
                                            : Colors.grey.shade200,
                                        onPressed: () {
                                          if (!reportSubmitted && enableBtn) {
                                            setState(() {
                                              _width = double.maxFinite;
                                              _state = 0;
                                              showSlider = false;
                                              feedBackText.clear();
                                              highlight = 2;
                                              selectedFeedback = 3;
                                              hint = "Report any errors.";
                                            });
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),// start frm here
                              Padding(
                                padding: const EdgeInsets.fromLTRB(6.0, 8, 6, 8),
                                child: Form(
                                    key: _formKey,
                                    child: Container(
                                      child: Column(children: <Widget>[
                                        Card(
                                          elevation: 6.0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(14.0)),
                                          child: Container(

                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: TextFormField(
                                                maxLines: showSlider ? null : 4,
                                                enabled: !showSlider,
                                                autofocus: false,
                                                controller: feedBackText,
                                                keyboardType: TextInputType.multiline,
                                                textCapitalization: TextCapitalization.sentences,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: hint,
                                                  focusColor: Colors.grey,
                                                  hintMaxLines: 5,
                                                ),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please enter some text';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(20.0),
                                          child: RaisedButton(
                                            padding: EdgeInsets.symmetric(vertical: 10.0),
                                            color: Colors.pink,
                                            onPressed: (){

                                            },
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                                            child: Shimmer.fromColors(
                                              period: Duration(seconds: 5),
                                              baseColor: Colors.black,
                                              highlightColor: Colors.deepPurpleAccent,

                                              child: Text("Send", style: TextStyle(
                                                  color: Colors.white70, fontSize: 24
                                              )),
                                            ),
                                          ),
                                        ),

                                      ],
                                      ),
                                    )





                                ),
                              )]))])]));

  }
}
//