import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Home extends StatefulWidget {
  Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Povong'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text('Account'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('My Trips'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'please enter drop location.';
                          }
                        },
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          hintText: "Trincomalee",
                        ),
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Exo2",
                            color: Colors.white),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),
                flex: 6),
            Expanded(
                child: BottomAppBar(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => setState(() => _value = 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              height: 56,
                              width: 56,
                              color: _value == 0
                                  ? Colors.grey
                                  : Colors.transparent,
                              child: Image.asset(
                                'assets/icons/bike.png',
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => setState(() => _value = 1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                                height: 56,
                                width: 56,
                                color: _value == 1
                                    ? Colors.grey
                                    : Colors.transparent,
                                child: Image.asset('assets/icons/tuk.png')),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => setState(() => _value = 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                                height: 56,
                                width: 56,
                                color: _value == 2
                                    ? Colors.grey
                                    : Colors.transparent,
                                child: Image.asset('assets/icons/car.png')),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => setState(() => _value = 3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                                height: 56,
                                width: 56,
                                color: _value == 3
                                    ? Colors.grey
                                    : Colors.transparent,
                                child: Image.asset('assets/icons/van.png')),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => setState(() => _value = 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                                height: 56,
                                width: 56,
                                color: _value == 4
                                    ? Colors.grey
                                    : Colors.transparent,
                                child: Image.asset('assets/icons/truck.png')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                flex: 1),
            Expanded(
              child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                          onPressed: () {
                            infoModalBottomSheet(context, _value);
                          },
                          child: Text(
                            "Book Now",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.black,
                        )),
                      ],
                    ),
                  ),
                  onTap: () => {}),
              flex: 1,
            )
          
          ],
        ),
      ),
    );
  }

  Future<bool> infoModalBottomSheet(context, value) {
      dynamic selected_image=null;

      switch (value) {
        case 0:
          selected_image= 'assets/icons/bike.png';
          break;
        case 1:
          selected_image= 'assets/icons/tuk.png';
          break;
        case 2:
          selected_image= 'assets/icons/car.png';
          break;
        case 3:
          selected_image= 'assets/icons/van.png';
          break;
        case 4:
          selected_image= 'assets/icons/truck.png';
          break;
        default:
          selected_image= 'assets/icons/bike.png';
      }
    return showModalBottomSheet(
        enableDrag: false,
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              child: new Wrap(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: ListTile(
                        title: Text('Finding a vehicle for you'),
                        trailing: Image.asset(selected_image),
                      )),
                  Divider(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: StepProgressIndicator(totalSteps: 5, currentStep: 1),
                  ),
                  
                  CircleAvatar(minRadius:80),
                  
                  Center(child: Text('Driver Name', style: TextStyle(fontSize: 20),),),
                   Expanded(
              child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel Trip",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.black,
                        )),
                      ],
                    ),
                  ),
                  onTap: () => {}),
              flex: 1,
            )
          
                ],
              ),
            );
          });
        });
  }
}
