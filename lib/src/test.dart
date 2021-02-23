import 'package:flutter/material.dart';
import 'package:my_flutter_app/generated/l10n.dart';

class Testovi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            MaterialLocalizations.of(context).alertDialogLabel,
            style: TextStyle(fontSize: 32, color: Colors.deepOrange),
          ),
          Text(
            s.hi_loco,
            style: TextStyle(fontSize: 32, color: Colors.deepOrange),
          ),
        ],
      ),
    );
  }
}
