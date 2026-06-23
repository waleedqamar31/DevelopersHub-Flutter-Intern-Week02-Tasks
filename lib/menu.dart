import 'package:flutter/material.dart';
import 'package:week2/homepage.dart';
import 'package:week2/simpletodo/todo_screen.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(
                'Week 2 Tasks',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: .bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                spacing: 15,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,

                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (builder) => TodoScreen()),
                        );
                      },
                      child: Card(
                        color: Colors.teal,
                        elevation: 5,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Simple Todo App',
                              textAlign: .center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: .bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 150,

                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) =>
                                MyHomePage(title: 'Persistant Counter'),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.teal,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Persistant Counter',
                              textAlign: .center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: .bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
