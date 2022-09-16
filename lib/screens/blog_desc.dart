import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogDesc extends StatelessWidget {
  String dummy = lorem(paragraphs: 2, words: 40);

  @override
  Widget build(BuildContext context) {
    List<String> arr = dummy.split("/n");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Icon(
              Icons.save,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Icon(
              Icons.upload_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200.h,
            width: double.infinity.w,
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/minimal.jpg'))),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.all(10.sp),
            child: Text(
              'Monarch population soars 4,900 percent since last year in thrilling 2021 western migration',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  letterSpacing: 1.6),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28.sp,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'By Andy Corbley',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Text(
                  '1hr ago',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RowItem(icon: Icons.comment, text: '8 comments'),
              RowItem(icon: Icons.favorite_outline, text: '34 likes'),
              RowItem(icon: Icons.share, text: 'Share'),
            ],
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (BuildContext, index) {
              return Text(arr.elementAt(index));
            },
            itemCount: arr.length,
          ))
        ],
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem({this.icon, this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 6.w,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
