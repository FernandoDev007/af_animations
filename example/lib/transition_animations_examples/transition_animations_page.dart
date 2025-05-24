import 'package:flutter/material.dart';

/// **Transition Animations Page**
///
/// This page demonstrates transition animations for state and screen changes.
/// These widgets help create smooth transitions between different states,
/// screens, or visual elements.
class TransitionAnimationsPage extends StatefulWidget {
  const TransitionAnimationsPage({
    super.key,
  });

  @override
  State<TransitionAnimationsPage> createState() => _TransitionAnimationsPageState();
}

class _TransitionAnimationsPageState extends State<TransitionAnimationsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Text('Transition Animations'),
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
                    child: Text("AfFadeTransition", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfSlideTransition", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfScaleTransition", textAlign: TextAlign.center)
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