import 'package:flutter/material.dart';

void main() => runApp(
      Column(
        children: <Widget>[
          Text(
            'Deliver features faster',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Craft beautiful UIs',
            textDirection: TextDirection.rtl,
          ),
          Column(
            children: <Widget>[
              Text(
                'Text dentro de um column que esta tendo de outro column sendo executado no main',
                textDirection: TextDirection.rtl,
              )
            ],
          )
        ],
      ),
    );
