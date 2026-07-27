import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controller = TextEditingController();
  bool? isCheck = false;
  bool isSwitched = false;
  double slideValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder()),
            //! When you use Arrow function like this '() =>', you are telling
            //! that have just one function to use.
            onEditingComplete: () => setState(() {}),
          ),
          Text(controller.text),
          //! When you use 'adaptative' in Widgets, it tells flutter to adapte
          //! your code to change automatically the apparence on diferrents devices
          //! like Android, IOS, or just a WebPage
          Checkbox.adaptive(
            tristate: true,
            value: isCheck,
            onChanged: (bool? value) {
              setState(() {
                isCheck = value;
              });
            },
          ),
          CheckboxListTile.adaptive(
            tristate: true,
            title: Text('Click me'),
            value: isCheck,
            onChanged: (bool? value) {
              setState(() {
                isCheck = value;
              });
            },
          ),
          Switch.adaptive(
            value: isSwitched,
            //! I have made use this form using arrow function
            onChanged: (bool value) => setState(() {
              isSwitched = !isSwitched;
            }),
          ),
          SwitchListTile.adaptive(
            title: Text("I don't know"),
            value: isSwitched,
            //! I have made this format using multiple function
            onChanged: (bool value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
          Slider(
            value: slideValue,
            onChanged: (double value) {
              setState(() {
                slideValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
