import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hubtel_coding_challenge/screens/history_page.dart';
import 'package:hubtel_coding_challenge/screens/schedule_page.dart';
import 'package:hubtel_coding_challenge/screens/send_page.dart';
import 'package:hubtel_coding_challenge/utils/app_colors.dart';
import 'package:hubtel_coding_challenge/utils/constants.dart';

import 'home_page.dart';

class BottomNavigatorPage extends StatefulWidget {
  const BottomNavigatorPage({super.key});

  @override
  State<BottomNavigatorPage> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorPage> {
  final List<Widget> _pages = const [
    HomePage(),
    SendPage(),
    HistoryPage(),
    SchedulePage(),
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    d.init(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.homeColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(d.pSH(10))),
        onPressed: (){
        }, label: const Text("SEND NEW", style: TextStyle(color: Colors.white ),), icon: CircleAvatar(
          radius: d.pSH(20),
          backgroundColor: Colors.white, child:  Icon(Icons.add, color: AppColors.homeColor,),),),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.textFieldColor))),
        padding:
            EdgeInsets.symmetric(horizontal: d.pSW(10), vertical: d.pSW(10)),
        width: d.getPhoneScreenWidth(),
        child: Row(
          children: [
            FloatingActionButton.small(
                elevation: 0,
                shape: const CircleBorder(),
                backgroundColor: AppColors.homeColor.withOpacity(0.3),
                heroTag: 'home-button',
                child: SvgPicture.asset("assets/icons/home_icon.svg"),
                onPressed: () {
                  setState(() {
                    _currentPage = 2;
                  });
                }),
            Container(
              margin: EdgeInsets.symmetric(horizontal: d.pSW(5)),
              height: d.pSH(50),
              width: d.pSW(1),
              color: AppColors.textFieldColor,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(icon: 'send_icon', label: "Send", position: 1),
                  _buildNavItem(
                      icon: 'history_icon', label: "History", position: 2),
                  _buildNavItem(
                      icon: 'schedule_icon', label: "Schedule", position: 3),
                ],
              ),
            )
          ],
        ),
      ),
      body: IndexedStack(
        alignment: Alignment.center,
        index: _currentPage,
        children: _pages,
      ),
    );
  }

  GestureDetector _buildNavItem(
      {required String icon, required String label, required int position,}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentPage = position;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/$icon.svg",

            color: icon=="history_icon"?null: _currentPage == position
                ? Colors.black
                : Colors.black.withOpacity(0.3),
          ),
          Text(
            label,
            style: TextStyle(
                color: _currentPage == position
                    ? Colors.black
                    : Colors.black.withOpacity(0.3),
                fontSize: d.pSH(14)),
          ),
        ],
      ),
    );
  }
}
