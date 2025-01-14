import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


  loadingView(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return const CupertinoAlertDialog(
              content:  Row(
                children: [
                  Text('Loading .... '),
                  Spacer(),
                  CircularProgressIndicator(),
                ],
              ));
        }
    );

  }
