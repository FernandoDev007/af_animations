import 'package:af_animations_example/select_example_type.dart';
import 'package:flutter/material.dart';


class LayoutAnimationsPage extends StatefulWidget {
  const LayoutAnimationsPage({
    super.key,
  });

  @override
  State<LayoutAnimationsPage> createState() => _LayoutAnimationsPageState();
}

class _LayoutAnimationsPageState extends State<LayoutAnimationsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Text('Layout Animations'),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedContainer", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedSizedBox", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedPositioned", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedAlign", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedPadding", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SelectExampleTypePage(
                          description: "The animated version of the ClipRRect widget. \n\n"
                          "Note: It's better to use AfAnimatedContainer.\nUse this widget if your case requires it.",
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
                    child: const Text("AfAnimatedClipRRect", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfAnimatedTransform", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 30),
              ],
            ),
          )
        ),
      ),
    );
  }

}


