import 'package:first_app_flutter/data/notifiers.dart';
import 'package:first_app_flutter/views/pages/home_page.dart';
import 'package:first_app_flutter/views/pages/profile_page.dart';
import 'package:first_app_flutter/views/pages/settings_page.dart';
import 'package:first_app_flutter/views/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Mapp'),
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return isDarkMode
                    ? Icon(Icons.light_mode)
                    : Icon(Icons.dark_mode);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              //! When you use the pushReplacement, it close the previously page
              //! and it signs that have no way to return.
              //! In this case there is no necessary use replace on page, because
              //! if you return there is a blank page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
