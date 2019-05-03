import 'package:flutter/material.dart';
import 'package:luyenthithpt/components/components.dart';
import 'package:luyenthithpt/logic/getData.dart';
import 'package:luyenthithpt/pages/quiz_page.dart';
import 'package:connectivity/connectivity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    checkConnection() async {
      var result = await (Connectivity().checkConnectivity());
      print('here: $result');
      if (result == ConnectivityResult.none) {
        print('here:: $result');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Icon(
                  Icons.perm_scan_wifi,
                  color: Color(0xff47525E),
                ),
                content:
                    Text('Vui lòng kết nối với wifi hoặc 3g để sử dụng app'),
              );
            });
      }
    }
    checkConnection();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Thư viện đề'),
      body: TabBarView(
        children: <Widget>[
          //Trang Anh Van
          Container(
              //searchBar(),
              child: FutureBuilder(
            future: getData("https://api.npoint.io/8f2217ef90fe93f74411"),
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
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    QuizPage(snapshot.data[index])));
                      },
                      child: itemTile(
                          context,
                          snapshot.data[index].name,
                          snapshot.data[index].author,
                          snapshot.data[index].description,
                          snapshot.data[index].link,
                          true),
                    );
                  },
                );
              }
            },
          )),

          //Trang Toan
          Container(
              //searchBar(),
              child: FutureBuilder(
            future: getData("https://api.npoint.io/02afc7560f55505bcd4d"),
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
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    QuizPage(snapshot.data[index])));
                      },
                      child: itemTile(
                          context,
                          snapshot.data[index].name,
                          snapshot.data[index].author,
                          snapshot.data[index].description,
                          snapshot.data[index].link,
                          true),
                    );
                  },
                );
              }
            },
          )),

          //Trang Ly
          Container(
              //searchBar(),
              child: FutureBuilder(
            future: getData("https://api.npoint.io/7e4bac486643db9b5412"),
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
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    QuizPage(snapshot.data[index])));
                      },
                      child: itemTile(
                          context,
                          snapshot.data[index].name,
                          snapshot.data[index].author,
                          snapshot.data[index].description,
                          snapshot.data[index].link,
                          true),
                    );
                  },
                );
              }
            },
          )),

          //Trang Hoa
          Container(
              //searchBar(),
              child: FutureBuilder(
            future: getData("https://api.npoint.io/92c3071d934a4d305655"),
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
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    QuizPage(snapshot.data[index])));
                      },
                      child: itemTile(
                          context,
                          snapshot.data[index].name,
                          snapshot.data[index].author,
                          snapshot.data[index].description,
                          snapshot.data[index].link,
                          true),
                    );
                  },
                );
              }
            },
          )),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color(0xffE6E9F2),
        child: SafeArea(
          child: Container(
            height: 80,
            color: Color(0xffE6E9F2),
            child: TabBar(
              labelStyle: TextStyle(fontSize: 17),
              labelColor: Color(0xff47525E),
              indicatorColor: Color(0xff979797),
              tabs: <Widget>[
                Tab(icon: Icon(Icons.face, size: 33), text: "Sinh"),
                Tab(icon: Icon(Icons.memory, size: 33), text: "Toán"),
                Tab(icon: Icon(Icons.motorcycle, size: 33), text: "Lý"),
                Tab(icon: Icon(Icons.opacity, size: 33), text: "Hoá")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
