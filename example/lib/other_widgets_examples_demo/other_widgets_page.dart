import 'package:af_animations_example/select_example_type.dart';
import 'package:flutter/material.dart';


class OtherWidgetsPage extends StatefulWidget {
  const OtherWidgetsPage({
    super.key,
  });

  @override
  State<OtherWidgetsPage> createState() => _OtherWidgetsPageState();
}

class _OtherWidgetsPageState extends State<OtherWidgetsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Text('Other Widgets'),
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
                        description: "The 'Builder' version, which has AfWidget implemented inside.",
                        titleUnoptimizeVersion: "Without using AfBuilder",
                        onTapUnoptimizeVersion: () {
                          Navigator.of(context).pushNamed("/builder_page_unoptimized");
                        },
                        titleOptimizeVersion: "Using AfBuilder",
                        onTapOptimizedVersion: () {
                          Navigator.of(context).pushNamed("/builder_page_optimized");
                        },
                        title: "AfBuilder Demo"
                      ))
                    );
                  },
                  child: const Text("AfBuilder")
                ),
              ),

              /// const SizedBox(height: 15),

              /// SizedBox(
              ///   width: MediaQuery.of(context).size.width * 0.6,
              ///   child: const ElevatedButton(
              ///     onPressed: null, ///In progress
              ///     child: Text("AfAnimatedMatrix4")
              ///   ),
              /// ),

              const SizedBox(height: 20),
            ],
          ),
        )
      ),
    );
  }

}

