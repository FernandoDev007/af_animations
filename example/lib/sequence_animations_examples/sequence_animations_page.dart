import 'package:flutter/material.dart';

/// **Sequence Animations Page**
///
/// This page demonstrates complex sequential and coordinated animations.
/// These widgets help create sophisticated animation sequences that would
/// be difficult to achieve with individual animations.
class SequenceAnimationsPage extends StatefulWidget {
  const SequenceAnimationsPage({
    super.key,
  });

  @override
  State<SequenceAnimationsPage> createState() => _SequenceAnimationsPageState();
}

class _SequenceAnimationsPageState extends State<SequenceAnimationsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: AppBar(
          title: const Text('Sequence Animations'),
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
                    child: Text("AfSequenceValue", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfSequenceColor", textAlign: TextAlign.center)
                  ),
                ),
        
                const SizedBox(height: 15),
        
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const ElevatedButton(
                    onPressed: null, ///In progress
                    child: Text("AfLoop", textAlign: TextAlign.center)
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