import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import "colors.dart" as customColor;
import 'constants.dart';
import 'dart:async';

class DrillModel {
  final String name;
  final String description;
  final int totalCount;
  final String imageUrl;
  final String category;

  DrillModel({
    required this.name,
    required this.description,
    required this.totalCount,
    required this.imageUrl,
    required this.category,
  });

  factory DrillModel.fromJson(Map<String, dynamic> json, String imageUrl) {
    return DrillModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      totalCount: json['totalCount'] ?? 0,
      imageUrl: imageUrl,
      category: json['category'] ?? '',
    );
  }
}

class Drills extends StatefulWidget {
  const Drills({Key? key}) : super(key: key);

  @override
  _DrillsState createState() => _DrillsState();
}

class _DrillsState extends State<Drills> {
  List<DrillModel> drillList = [];
  bool _isLoading = true;
  String _error = '';

  Future<void> _fetchDrills() async {
    try {
      final response = await http
          .get(
            Uri.parse('${Constants.apiBaseUrl}/api/drills'),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(
            const Duration(seconds: 5),
            onTimeout: () {
              throw TimeoutException('Connection timed out');
            },
          );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _updateDrillList(data);
      } else {
        throw HttpException('Failed to load drills');
      }
    } catch (e) {
      print('Error fetching drills: $e');
      // Fallback to mock data
      _updateDrillList(MockDrills.data);
    }
  }

  void _updateDrillList(List<dynamic> data) {
    setState(() {
      drillList =
          data
              .map(
                (drill) =>
                    DrillModel.fromJson(drill, DrillImages.getRandomImage()),
              )
              .toList();
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchDrills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColor.AppColor.homePageBackground,
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : _error.isNotEmpty
              ? Center(child: Text(_error))
              : Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 30.h,
                        left: 30.w,
                        right: 30.w,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 300.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            customColor.AppColor.gradientFirst.withOpacity(0.9),
                            customColor.AppColor.gradientSecond,
                          ],
                          begin: const FractionalOffset(0.0, 0.4),
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color:
                                      customColor
                                          .AppColor
                                          .secondPageTopIconColor,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color:
                                    customColor.AppColor.secondPageTopIconColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            "Football Drills",
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: Colors.white, // Changed color to white
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "and Training Workouts",
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: Colors.white, // Changed color to white
                            ),
                          ),
                          SizedBox(height: 50.h),
                          Row(
                            children: [
                              Container(
                                width: 85.w, // reduced from 90.w
                                height: 30.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      customColor
                                          .AppColor
                                          .secondPageContainerGradient1stColor,
                                      customColor
                                          .AppColor
                                          .secondPageContainerGradient2ndColor,
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 18, // reduced size
                                      color:
                                          customColor
                                              .AppColor
                                              .secondPageIconColor,
                                    ),
                                    SizedBox(width: 4.w), // reduced spacing
                                    Text(
                                      "68 min",
                                      style: TextStyle(
                                        fontSize: 14.sp, // reduced font size
                                        color:
                                            customColor
                                                .AppColor
                                                .secondPageIconColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 15.w), // reduced spacing
                              Expanded(
                                // Added Expanded
                                child: Container(
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        customColor
                                            .AppColor
                                            .secondPageContainerGradient1stColor,
                                        customColor
                                            .AppColor
                                            .secondPageContainerGradient2ndColor,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.handyman_outlined,
                                        size: 18, // reduced size
                                        color:
                                            customColor
                                                .AppColor
                                                .secondPageIconColor,
                                      ),
                                      SizedBox(width: 4.w), // reduced spacing
                                      Text(
                                        "Basic Equipment",
                                        style: TextStyle(
                                          fontSize: 14.sp, // reduced font size
                                          color:
                                              customColor
                                                  .AppColor
                                                  .secondPageIconColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 15.w), // reduced spacing
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(70),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 30.h),
                            Row(
                              children: [
                                SizedBox(width: 30.w),
                                Text(
                                  "Circuit 1: Ball Control",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: customColor.AppColor.circuitsColor,
                                  ),
                                ),
                                Expanded(child: Container()),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.loop,
                                      size: 30,
                                      color: customColor.AppColor.loopColor,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "3 sets",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: customColor.AppColor.setsColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20.w),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            _buildDrillsList(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }

  Widget _buildDrillsList() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w), // reduced padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: drillList.length,
                itemBuilder: (_, index) {
                  final drill = drillList[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 15.h),
                    padding: EdgeInsets.all(12.w), // reduced padding
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 10,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 70.w, // reduced size
                          height: 70.h, // reduced size
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/ex${(index % 4) + 1}.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w), // reduced spacing
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                drill.name,
                                style: TextStyle(
                                  fontSize: 15.sp, // slightly reduced font size
                                  fontWeight: FontWeight.bold,
                                  color: customColor.AppColor.circuitsColor,
                                ),
                                overflow:
                                    TextOverflow
                                        .ellipsis, // handle text overflow
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "${drill.totalCount} times",
                                style: TextStyle(
                                  fontSize: 13.sp, // slightly reduced font size
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
