import 'package:flutter/material.dart';
Widget searchBar() {
  return Container(
    height: 55,
    decoration: BoxDecoration(
        border: Border.all(
            color: Color(0xffDDE3EC), style: BorderStyle.solid, width: 1.5)),
    child: Container(
      margin: EdgeInsets.fromLTRB(20, 7, 20, 7),
      decoration: BoxDecoration(
          color: Color(0xffE6E9F2),
          border: Border.all(width: 1.2, color: Color(0xffE6E9F2)),
          borderRadius: BorderRadius.all(Radius.circular(7.0))),
      child: TextField(
        //textAlign: TextAlign.center,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff8190A5),
          ),
          contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
          border: InputBorder.none,
          hintText: 'Tìm đề',
          hintStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Color(0xff8190A5)),
        ),
      ),
    ),
  );
}

Widget myAppBar(String text) {
  return AppBar(
      title: Text(
        text,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          color: Color(0xff47525E),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0);
}


Widget pageContainer(Widget mainWidget) {
  return Container(
    child: Column(
      children: <Widget>[searchBar(), mainWidget],
    ),
  );
}

Widget itemTile(BuildContext context, String name, String author,
    String description,String link, bool isDone) {
  return  Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
        color: Colors.white,
          border: Border.all(
              style: BorderStyle.solid, width: 1.0, color: Color(0xffD2DAE6))),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Mã đề: $name",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff47525E)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Tác giả: $author",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff47525E)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Mô Tả: $description",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8190A5)),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.check,
            color: isDone == true ? Color(0xff47525E) : Colors.white,
            size: 35.0,
          )
        ],
      ),
    
  );
}