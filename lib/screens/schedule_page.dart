import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/utils/constants.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _MySchedulePageState();
}

class _MySchedulePageState extends State<SchedulePage> {
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
              : const Center(
                  child: Text("Schedule Page"),
                )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
