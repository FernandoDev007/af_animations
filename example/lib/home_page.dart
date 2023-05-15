import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Text('Af Animations App Demo'),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("Value Animations")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/implicitly_demo");
                  },
                  child: const Text("Implicitly Animations")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("Interval Animations")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("Simple Animations")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("Other Widgets Animations")
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("Navigation Animations")
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        )
      ),
    );
  }

}

