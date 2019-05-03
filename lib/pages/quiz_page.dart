import 'dart:io';
import 'package:flutter/material.dart';
import 'package:luyenthithpt/logic/getData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:luyenthithpt/pages/result_page.dart';
import 'package:firebase_admob/firebase_admob.dart';

class Result {
  String yourAnswer;
  String serverAnswer;
  String image;
  Result(this.yourAnswer, this.serverAnswer, this.image);
}

class QuizPage extends StatefulWidget {
  final Item item;
  QuizPage(this.item);

  //QuizPage({Key key, @required this.item}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Question question;
  List<Result> groupValue = [];
  var appId;
  var appUnit;
  var buildInterstitial;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      appId = 'ca-app-pub-2718889817697354~8991141115';
      appUnit = 'ca-app-pub-2718889817697354/3945508627';
    } else {
      appId = 'ca-app-pub-2718889817697354~4408543054';
      appUnit = 'ca-app-pub-2718889817697354/7055242910';
    }
    FirebaseAdMob.instance.initialize(appId: appId);

    MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['quiz', 'education', 'learn', 'learning', 'hoc', 'hoc online', 'thi thpt'],
      //testDevices: <String>[], // Android emulators are considered test devices
    );

    InterstitialAd myInterstitial = InterstitialAd(
      // Replace the testAdUnitId with an ad unit id from the AdMob dash.
      // https://developers.google.com/admob/android/test-ads
      // https://developers.google.com/admob/ios/test-ads
      //adUnitId: InterstitialAd.testAdUnitId,
      adUnitId: appUnit,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );

    buildInterstitial = myInterstitial..load();

    for (int i = 0; i < widget.item.number; i++) {
      groupValue.add(Result('', '', ''));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    buildInterstitial.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'Mã đề : ${widget.item.name}',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w300,
                color: Color(0xff47525E),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0),
        body: Container(
          child: FutureBuilder(
            future: getDataQuiz(widget.item.link),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Container(
                    width: 350,
                    height: 350,
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('logo.png'),
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color((0xff47525E))),
                        ),
                      ],
                    )),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => Card(
                        color: Colors.white,
                        elevation: 0.0,
                        child: ExpansionTile(
                          title: Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'Câu số: ${index + 1}',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: groupValue[index].yourAnswer == ''
                                          ? Color(0xff47525E)
                                          : Colors.blue),
                                ),
                              ],
                            ),
                          ),
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10.0),
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data[index].image,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    new CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color((0xff47525E))),
                                    ),
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Radio(
                                      onChanged: (String e) => setValueRadio(
                                          index, e, snapshot.data),
                                      value: 'a',
                                      groupValue: groupValue[index].yourAnswer,
                                      activeColor: Color(0xff47525E),
                                    ),
                                    Text(
                                      'A',
                                      style: TextStyle(
                                          color: Color(0xff47525E),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Radio(
                                      onChanged: (String e) => setValueRadio(
                                          index, e, snapshot.data),
                                      value: 'b',
                                      groupValue: groupValue[index].yourAnswer,
                                      activeColor: Color(0xff47525E),
                                    ),
                                    Text(
                                      'B',
                                      style: TextStyle(
                                          color: Color(0xff47525E),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Radio(
                                      onChanged: (String e) => setValueRadio(
                                          index, e, snapshot.data),
                                      value: 'c',
                                      groupValue: groupValue[index].yourAnswer,
                                      activeColor: Color(0xff47525E),
                                    ),
                                    Text(
                                      'C',
                                      style: TextStyle(
                                          color: Color(0xff47525E),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Radio(
                                      onChanged: (String e) => setValueRadio(
                                          index, e, snapshot.data),
                                      value: 'd',
                                      groupValue: groupValue[index].yourAnswer,
                                      activeColor: Color(0xff47525E),
                                    ),
                                    Text(
                                      'D',
                                      style: TextStyle(
                                          color: Color(0xff47525E),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                );
              }
            },
          ),
        ),
        bottomNavigationBar: Container(
          color: Color(0xffE6E9F2),
          child: SafeArea(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton.icon(
                    elevation: 0,
                    color: Color(0xffE6E9F2),
                    onPressed: () => Navigator.pop(context),
                    label: Text('Trở về'),
                    icon: Icon(
                      Icons.home,
                      size: 35,
                    ),
                  ),
                  RaisedButton.icon(
                    elevation: 0,
                    color: Color(0xffE6E9F2),
                    onPressed: () {
                      buildInterstitial
                        ..show(
                          anchorType: AnchorType.bottom,
                          anchorOffset: 0.0,
                        );

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(groupValue)));
                      dispose();
                    },
                    label: Text('Nộp bài'),
                    icon: Icon(
                      Icons.book,
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calculatePoint() {}

  void setTitleColor(index) {
    setState(() {});
  }

  void setValueRadio(index, String e, data) {
    setState(() {
      if (e == 'a') {
        groupValue.removeAt(index);
        groupValue.insert(
            index, Result(e, data[index].answer, data[index].image));
      } else if (e == 'b') {
        groupValue.removeAt(index);
        groupValue.insert(
            index, Result(e, data[index].answer, data[index].image));
      } else if (e == 'c') {
        groupValue.removeAt(index);
        groupValue.insert(
            index, Result(e, data[index].answer, data[index].image));
      } else if (e == 'd') {
        groupValue.removeAt(index);
        groupValue.insert(
            index, Result(e, data[index].answer, data[index].image));
      }

      // for(int i =0; i<= groupValue.length; i++){
      //   if(groupValue[i] == data[i].answer){
      //     totalPoint++;

      print('Group value length: ${groupValue.length}');
      print(
          'Data your answer ${groupValue[index].yourAnswer} - Data server answer ${groupValue[index].serverAnswer}');
      //   }
      // }
    });
  }
}
