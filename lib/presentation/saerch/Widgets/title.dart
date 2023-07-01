import 'package:flutter/cupertino.dart';

class SearchTextTitle extends StatelessWidget {
  final String title;
  const SearchTextTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
