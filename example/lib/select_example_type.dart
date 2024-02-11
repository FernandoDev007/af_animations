import 'package:flutter/material.dart';


class SelectExampleTypePage extends StatefulWidget {
  final VoidCallback? onTapUnoptimizeVersion;
  final String? titleUnoptimizeVersion;
  final VoidCallback onTapOptimizedVersion;
  final String? titleOptimizeVersion;
  final String title;
  final String? description;

  const SelectExampleTypePage({
    super.key,
    this.onTapUnoptimizeVersion,
    required this.onTapOptimizedVersion,
    required this.title,
    this.titleUnoptimizeVersion,
    this.titleOptimizeVersion,
    required this.description,
  });

  @override
  State<SelectExampleTypePage> createState() => _SelectExampleTypePageState();
}

class _SelectExampleTypePageState extends State<SelectExampleTypePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.description != null)
              const SizedBox(height: 20),
    
              if (widget.description != null)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Text(
                  widget.description!,
                  textAlign: TextAlign.center
                ),
              ),
    
              const SizedBox(height: 20),
    
              if (widget.onTapUnoptimizeVersion != null)
              SizedBox( 
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: widget.onTapUnoptimizeVersion,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)
                  ),
                  child: Text(
                    widget.titleUnoptimizeVersion ?? "Unoptimized version",
                    textAlign: TextAlign.center,
                  )
                ),
              ),
    
              if (widget.onTapUnoptimizeVersion != null)
              const SizedBox(height: 15),
    
              SizedBox( 
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: widget.onTapOptimizedVersion,
                  child: Text(
                    widget.titleOptimizeVersion ?? "Optimized version",
                    textAlign: TextAlign.center,
                  ),
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

