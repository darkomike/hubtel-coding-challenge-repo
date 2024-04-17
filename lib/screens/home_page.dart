import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  late bool _isLoading;
  @override
  void initState() {
    _isLoading = true;
    super.initState();

    init();
  }

  init() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      lg("Error Init: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            :  SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                     height: 60,
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
