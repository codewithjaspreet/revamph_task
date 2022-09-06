import 'package:blog_minimal/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
// There are no fields for Time and Author (current time will be pushed to db & current user displayname as authername)
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Create Post',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                ),
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Material(
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.yellow,
                    child: Ink(
                      width: size.width * 0.8,
                      height: size.height * 0.2,
                      child: Center(child: Text('Select Image')),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.025),
              Text(
                'Title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.005),
              CustomTextField(hint: 'Enter Title'),
              SizedBox(height: size.height * 0.03),
              Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.005),
              CustomTextField(hint: 'Enter Description'),
              SizedBox(height: size.height * 0.02),
              Align(
                child: Container(
                    width: size.width * 0.5,
                    height: size.height * 0.06,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFFFD810))),
                        onPressed: () => null,
                        child: Text('Create Post'))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
