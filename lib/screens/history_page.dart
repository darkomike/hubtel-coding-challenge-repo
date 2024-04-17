import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hubtel_coding_challenge/utils/app_colors.dart';
import 'package:hubtel_coding_challenge/utils/constants.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _MyHistoryPageState();
}

class _MyHistoryPageState extends State<HistoryPage> {
  late bool _isLoading;

  late PageController _pageController;
  late TextEditingController controller;
  @override
  void initState() {
    _isLoading = true;
    super.initState();

    init();
  }

  init() async {
    try {
      _pageController = PageController();
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
              : SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(left: d.pSH(10), right: d.pSH(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Container(
                                margin:
                                    EdgeInsets.symmetric(vertical: d.pSH(5)),
                                height: d.pSH(51),
                                decoration: BoxDecoration(
                                    color: AppColors.textFieldColor,
                                    borderRadius: BorderRadius.circular(6)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: AnimatedContainer(
                                          alignment: Alignment.center,
                                          duration:
                                              const Duration(milliseconds: 600),
                                          margin: EdgeInsets.all(d.pSH(4)),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Text(
                                            "History",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: d.pSH(16),
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                    Expanded(
                                      child: AnimatedContainer(
                                          alignment: Alignment.center,
                                          duration:
                                              const Duration(milliseconds: 600),
                                          margin: EdgeInsets.all(d.pSH(4)),
                                          decoration: BoxDecoration(
                                              color: null,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Text(
                                            "Transaction Summary",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AppColors
                                                    .textFieldTextColor,
                                                fontSize: d.pSH(16),
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ],
                                )),
                            Divider(
                              color: AppColors.textFieldColor,
                              thickness: 2,
                            ),

                            //Search And Filter
                            Container(
                              height: d.pSH(90),
                              color: Colors.blue,
                              child: Row(
                                children: [
                                  Expanded(child: TextFormField(
                                    controller: controller,
                                  )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                          'assets/icons/filter_icon.svg'))
                                ],
                              ),
                            )
                          ]),
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) => Container(),
                        ))
                      ],
                    ),
                  ),
                )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
