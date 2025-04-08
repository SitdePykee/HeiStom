import 'package:flutter/material.dart';
import 'package:heistom/renter/presentation/widgets/searchbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 0.2),
                Color.fromRGBO(33, 195, 255, 0.2),
                Color.fromRGBO(255, 255, 255, 0.2),
              ],
              stops: [0.0, 0.505, 1.0],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FakeSearchBar(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
