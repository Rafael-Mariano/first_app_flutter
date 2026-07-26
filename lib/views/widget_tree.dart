import 'package:first_app_flutter/views/pages/home_page.dart';
import 'package:first_app_flutter/views/pages/profile_page.dart';
import 'package:first_app_flutter/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Flutter Mapp'))),
      body: pages.elementAt(0),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
