import 'package:flutter/material.dart';

class DashboardBox extends StatelessWidget {
  DashboardBox({Key key, this.title, this.value}) : super(key: key);
  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 11.0,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "\$ ",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .apply(color: Colors.white, fontWeightDelta: 2),
                ),
                TextSpan(
                  text: value.toStringAsFixed(2),
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .apply(color: Colors.white, fontWeightDelta: 2),
                )
              ],
            ),
          ),
          SizedBox(
            height: 11.0,
          ),
        ],
      ),
    );
  }
}
