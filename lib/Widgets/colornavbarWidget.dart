import 'package:flutter/material.dart';
import 'package:kwentong_kultura/Widgets/notifier.dart';

class ColorNavbarWidget extends StatelessWidget {
  const ColorNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        Color backgroundColor =
            selectedPage == 0 || selectedPage == 1
                ? Color(0xFFACDC94)
                : Color(0xFFFFCCBC);

        return Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 2.0)),
          ),
          child: NavigationBar(
            backgroundColor: backgroundColor,
            destinations: [
              NavigationDestination(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.face_retouching_natural),
                ),
                label: 'Karakter',
              ),
              NavigationDestination(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.forest),
                ),
                label: 'Pangyayari',
              ),
            ],
            onDestinationSelected: (int value) {
              selectedPageNotifier.value = value;
            },
            selectedIndex: selectedPage,
          ),
        );
      },
    );
  }
}
