import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifire = ValueNotifier(0);

class BottomnavigationWidgets extends StatelessWidget {
  const BottomnavigationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifire,
      builder: (context, int Newindex, _) {
        return BottomNavigationBar(
            currentIndex: Newindex,
            onTap: (index) {
              indexChangeNotifire.value = index;
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: "New & Hot"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: "Fast Laughs"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download_for_offline), label: "Downloads")
            ]);
      },
    );
  }
}
