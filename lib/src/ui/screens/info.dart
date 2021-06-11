import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:package_info/package_info.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  var _version = "", _description = "";

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() => _version = packageInfo.version);
    });

    rootBundle
        .loadString('assets/about.txt')
        .then((value) => setState(() => _description = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: 64),
            FractionallySizedBox(
                widthFactor: 0.8, child: Image.asset("assets/polypus.png")),
            Text(
              "Versión $_version",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.grey[700]),
            ),
            SizedBox(height: 8),
            Text(_description),
          ],
        ),
      ),
    );
  }
}
