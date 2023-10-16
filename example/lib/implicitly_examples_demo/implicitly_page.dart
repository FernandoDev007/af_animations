import 'package:af_animations_example/select_example_type.dart';
import 'package:flutter/material.dart';


class ImplicitlyPage extends StatefulWidget {
  const ImplicitlyPage({
    super.key,
  });

  @override
  State<ImplicitlyPage> createState() => _ImplicitlyPageState();
}

class _ImplicitlyPageState extends State<ImplicitlyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Text('Implicitly Animations'),
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
                  child: Text("AfAnimatedDecoration")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("AfAnimatedContainer")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SelectExampleTypePage(
                        titleUnoptimizeVersion: "Without using AfAnimatedClipRRect",
                        onTapUnoptimizeVersion: () {
                          Navigator.of(context).pushNamed("/animated_clip_rrect_page_unoptimized");
                        },
                        titleOptimizeVersion: "Using AfAnimatedClipRRect",
                        onTapOptimizedVersion: () {
                          Navigator.of(context).pushNamed("/animated_clip_rrect_page_optimized");
                        },
                        title: "AfAnimatedClipRRect Demo"
                      ))
                    );
                  },
                  child: const Text("AfAnimatedClipRRect")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("AfAnimatedMatrix4")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("AfAnimatedPadding")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("AfAnimatedRotation")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("AfAnimatedScale")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("AfAnimatedOpacity")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("AfAnimatedAlign")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("AfAnimatedTransalte")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("AfAnimatedPositioned")
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const ElevatedButton(
                  onPressed: null, ///In progress
                  child: Text("AfAnimatedSizedBox")
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

