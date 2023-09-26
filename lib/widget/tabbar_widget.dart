import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TapBarWidget extends StatefulWidget {
  String name1;
  String name2;
  String name3;
  TabController tabController;

  TapBarWidget({Key? key,required this.name1,required this.name2,required this.name3,required this.tabController}) : super(key: key);

  @override
  State<TapBarWidget> createState() => _TapBarWidgetState();
}

class _TapBarWidgetState extends State<TapBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller:widget.tabController ,
              indicatorColor: Colors.blue,
              labelColor: Colors.black,
              tabs: [
            Tab(
              text: widget.name1,
            ),
            Tab(
              text: widget.name2,
            ),
            Tab(
              text: widget.name3,
            ),
          ]),
        ),
      ),
    );
  }
}
