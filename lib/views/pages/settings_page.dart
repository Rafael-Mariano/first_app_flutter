import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isCheck = false;
  bool isSwitched = false;
  double slideValue = 0.0;
  String? menuItem = 'e1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! If you use the StatefulWidget, here you need put widget.title
      appBar: AppBar(
        title: Text(widget.title),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Snackbar'),
                      duration: Duration(seconds: 3),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Text('Open SnackBar!'),
              ),
              Padding(padding: EdgeInsets.all(3.0)),
              //! Here is how you can create a divider
              Divider(
                color: Colors.green,
                thickness: 3.0,
                endIndent: 50.0,
                radius: BorderRadius.circular(5.0),
              ),
              //! Here is how to create a vertical divider
              Container(
                height: 50.0,
                child: VerticalDivider(color: Colors.green, thickness: 3.0),
              ),
              Padding(padding: EdgeInsets.all(3.0)),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Alert Title'),
                        content: Text('Alert Content'),
                        actions: [
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Open Dialog!'),
              ),
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: 'e1', child: Text('Element 1')),
                  DropdownMenuItem(value: 'e2', child: Text('Element 2')),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
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
                title: Text('Open Snackbar'),
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
              //! This is one form to make a gesture detection on an image
              GestureDetector(
                onTap: () => setState(() {
                  print("Image Selected!");
                }),
                child: Image.asset('assets/images/apple.jpg'),
              ),

              //! This is another way to make anything clikable
              InkWell(
                splashColor: Colors.green,
                onTap: () {
                  setState(() {
                    print("Image Selection 2 form");
                  });
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),

              ElevatedButton(onPressed: () {}, child: Text('Click me!')),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(),
                child: Text('Click me!'),
              ),
              TextButton(onPressed: () {}, child: Text('Click me!')),
              OutlinedButton(onPressed: () {}, child: Text('Click me!')),
              CloseButton(),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
