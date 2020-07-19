import 'package:flutter/material.dart';

class Footer extends StatefulWidget{
  const Footer();

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<Footer> {
  int _selectedIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  // Icon Info
  static const _footerIcons = [
    Icons.home,
    Icons.textsms,
    Icons.access_time,
    Icons.content_paste,
    Icons.work
  ];

  static const _footerItemNames = [
    "Home",
    "Talk",
    "Timeline",
    "News",
    "Wallet",
  ];

  BottomNavigationBarItem _updateActivateState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
        color: Colors.black87,
      ),
      title: Text(
        _footerItemNames[index],
        style: TextStyle(
          color: Colors.black87,
        ),
      )
    );
  }

  BottomNavigationBarItem _updateDeactivateState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
        color: Colors.black26,
      ),
      title: Text(
        _footerItemNames[index],
        style: TextStyle(
          color: Colors.black26,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _bottomNavigationBarItems.add(_updateActivateState(0));
    for (var i=1; i<_footerItemNames.length; i++){
      _bottomNavigationBarItems.add(_updateDeactivateState(i));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavigationBarItems[_selectedIndex] = _updateDeactivateState(_selectedIndex);
      _bottomNavigationBarItems[index] = _updateActivateState(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomNavigationBarItems,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}