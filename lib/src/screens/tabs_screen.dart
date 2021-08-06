import 'package:flutter/material.dart';
import 'package:newsapp/src/screens/screens.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Screens(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentScreen,
      onTap: (i) {
        navigationModel.currentScreen = i;
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          label: 'Para ti',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Titulares',
        ),
      ],
    );
  }
}

class _Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      //physics: BouncingScrollPhysics(),
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Screen(),
        // Container(
        //   color: Colors.green,
        // )
        Tab2Screen(),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentScreen = 0;

  PageController _pageController = new PageController();

  int get currentScreen => _currentScreen;
  set currentScreen(int value) {
    this._currentScreen = value;
    _pageController.animateToPage(
      value,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
