import 'package:af_animations_example/select_example_type.dart';
import 'package:flutter/material.dart';


class ValuePage extends StatefulWidget {
  const ValuePage({
    super.key,
  });

  @override
  State<ValuePage> createState() => _ValuePageState();
}

class _ValuePageState extends State<ValuePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Text('Value Animations'),
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
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SelectExampleTypePage(
                        titleUnoptimizeVersion: "Without using AfAnimatedValue",
                        onTapUnoptimizeVersion: () {
                          Navigator.of(context).pushNamed("/animated_value_page_unoptimized");
                        },
                        titleOptimizeVersion: "Using AfAnimatedValue",
                        onTapOptimizedVersion: () {
                          Navigator.of(context).pushNamed("/animated_value_page_optimized");
                        },
                        title: "AfAnimatedValue Demo"
                      ))
                    );
                  },
                  child: const Text("AfAnimatedValue")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("AfAnimatedSecondaryValue")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("AfAnimatedTerceryValue")
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

