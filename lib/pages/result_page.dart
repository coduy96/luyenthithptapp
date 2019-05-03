import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:luyenthithpt/pages/quiz_page.dart';


class ResultPage extends StatefulWidget {
  final List<Result> groupValue;
  ResultPage(this.groupValue);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double yourPoint = 0;
  String format(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
}
  @override
  
  void initState() {
    final double _markPercent =10/ widget.groupValue.length;
    super.initState();
    for (int i = 0; i < widget.groupValue.length; i++) {
      if (widget.groupValue[i].yourAnswer ==
              widget.groupValue[i].serverAnswer &&
          widget.groupValue[i].yourAnswer != '') {
        yourPoint = yourPoint + _markPercent;
      }
    }
    
  }

  @override
  Widget build(BuildContext context) {
    print('its lenght: ${widget.groupValue.length}');
    return Scaffold(
        appBar: AppBar(
            leading: Text(''),
            title: RichText(
              text: TextSpan(
                  text: 'Tổng điểm: ',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff47525E),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: format(yourPoint),
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.red),
                    )
                  ]),
            ),
            backgroundColor: Colors.white,
            elevation: 0),
        body: ListView.builder(
          itemCount: widget.groupValue.length,
          itemBuilder: (context, index) {
            if (widget.groupValue[index].image == '') {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        style: BorderStyle.solid,
                        width: 1.0,
                        color: Color(0xffD2DAE6)),
                  ),
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Câu số: ${index + 1}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Bạn chưa làm câu này =)))',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                          ),
                        ],
                      )),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(
                          style: BorderStyle.solid,
                          width: 1.0,
                          color: Color(0xffD2DAE6))),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Câu số: ${index + 1}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: widget.groupValue[index].yourAnswer ==
                                    widget.groupValue[index].serverAnswer
                                ? Colors.blue
                                : Colors.red,
                          ),
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl: widget.groupValue[index].image,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                                'Đáp án: ${widget.groupValue[index].serverAnswer}'),
                            Text(
                              'Bạn chọn: ${widget.groupValue[index].yourAnswer}',
                              style: TextStyle(
                                color: widget.groupValue[index].yourAnswer ==
                                        widget.groupValue[index].serverAnswer
                                    ? Colors.blue
                                    : Colors.red,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
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
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    label: Text('Trang chủ'),
                    icon: Icon(
                      Icons.home,
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        );
  }
}
