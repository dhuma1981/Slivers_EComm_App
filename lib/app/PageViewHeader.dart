import 'dart:async';

import 'package:flutter/material.dart';
import 'package:slivers_ecomm_demo/app/fakeStoreResponsePojo.dart';

class PageViewHeader extends StatefulWidget {
  // final FakeStoreResponsePojo objFakeStoreResPojo;
  List<FakeStoreResponsePojo> objFSRList;
  PageViewHeader({@required this.objFSRList});

  @override
  _PageViewHeaderState createState() => _PageViewHeaderState();
}

class _PageViewHeaderState extends State<PageViewHeader> {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('pageview: ${widget.objFakeStoreResPojo.id}');
    if (widget.objFSRList == null)
      widget.objFSRList = <FakeStoreResponsePojo>[];
    return PageView(
      controller: _pageController,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.objFSRList[5].image),
              // image: NetworkImage(
              //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcbhSTF1MyRkVM85i_uWJdsC1yuTfEjsh1Lw&usqp=CAU'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.objFSRList[19].image),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.objFSRList[14].image),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}
