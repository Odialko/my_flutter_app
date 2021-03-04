import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/generated/l10n.dart';

// import '../g.dart';

// abstract class Testovi extends Widget {
//   factory Testovi() {
//     if (gWeb) return _WebTestovi();
//     if (gIOS) return _IOSTestovi();
//     return _AndroidTestovi();
//   }
// }

class AndroidTestovi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Android flutter app',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
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

class IOSTestovi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'My IOS flutter app',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsetsDirectional.zero,
        // backgroundColor: theme.colors.white,
      ),
      child: Column(
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


class WebTestovi extends StatelessWidget {
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
