import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'drills.dart';
import 'colors.dart' as color;
import 'main.dart'; // Add this import for the welcome screen
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Info> info = [];
  bool _isLoading = true;

  _initData() async {
    try {
      var res = await DefaultAssetBundle.of(
        context,
      ).loadString("assets/json/info.json");
      var resInfo = json.decode(res);
      setState(() {
        info = List<Info>.from(resInfo.map((x) => Info.fromJson(x)));
        _isLoading = false;
      });
    } catch (e) {
      print("Error loading asset: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.AppColor.homePageBackground,
        body:
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.h,
                        horizontal: 30.w,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(top: 30.h),
                          child: Row(
                            children: [
                              Text(
                                "Training",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: color.AppColor.homePageTitle,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.homePageIcons,
                              ),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  Get.offAll(() => WelcomePage());
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: color.AppColor.homePageDetail,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.logout,
                                      size: 20,
                                      color: color.AppColor.homePageIcons,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 15),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: color.AppColor.homePageIcons,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 25.h,
                        horizontal: 30.w,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          children: [
                            Text(
                              "Training",
                              style: TextStyle(
                                fontSize: 20,
                                color: color.AppColor.homePageSubtitle,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () {
                                Get.to(() => Drills());
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Details",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.homePageDetail,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                    color: color.AppColor.homePageIcons,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.w,
                        horizontal: 30.w,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                color.AppColor.gradientFirst.withOpacity(0.8),
                                color.AppColor.gradientSecond.withOpacity(0.9),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(80),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(5, 10),
                                blurRadius: 20,
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.2),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 25,
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Next workout",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        color
                                            .AppColor
                                            .homePageContainerTextSmall,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Football Shooting",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color:
                                        color
                                            .AppColor
                                            .homePageContainerTextSmall,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "and Dribling Workout",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color:
                                        color
                                            .AppColor
                                            .homePageContainerTextSmall,
                                  ),
                                ),
                                SizedBox(height: 25),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.timer,
                                          size: 20,
                                          color:
                                              color
                                                  .AppColor
                                                  .homePageContainerTextSmall,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "60 min",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                color
                                                    .AppColor
                                                    .homePageContainerTextSmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        boxShadow: [
                                          BoxShadow(
                                            color: color.AppColor.gradientFirst,
                                            blurRadius: 10,
                                            offset: Offset(4, 8),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.play_circle_fill,
                                        color: Colors.white,
                                        size: 60,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.w,
                        horizontal: 30.w,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(top: 30),
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage("assets/card.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 40,
                                      offset: Offset(8, 10),
                                      color: color.AppColor.gradientSecond
                                          .withOpacity(0.3),
                                    ),
                                    BoxShadow(
                                      blurRadius: 10,
                                      offset: Offset(-1, -5),
                                      color: color.AppColor.gradientSecond
                                          .withOpacity(0.3),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(
                                  right: 200,
                                  bottom: 30,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage("assets/figure.png"),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: 100,
                                margin: const EdgeInsets.only(
                                  left: 150,
                                  top: 50,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "You are doing great",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: color.AppColor.homePageDetail,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.to(
                                          () => ProfilePage(),
                                        ); // Add this navigation
                                      },
                                      child: Text(
                                        "Check Leaderboard",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: color.AppColor.homePageDetail,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(
                        left: 30.w,
                        right: 30.w,
                        top: 15.h,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Text(
                          "Area of focus",
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                            color: color.AppColor.homePageTitle,
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.all(30.w),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio:
                              1.0, // Changed to 1.0 for perfect squares
                        ),
                        delegate: SliverChildBuilderDelegate((
                          BuildContext context,
                          int index,
                        ) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle, // Make container circular
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              // Clip the content in circular shape
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(
                                      2,
                                    ), // Add padding for border effect
                                    child: ClipOval(
                                      child: Image.asset(
                                        info.elementAt(index).img ?? "",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.7),
                                        ],
                                        stops: [0.5, 1.0],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        info.elementAt(index).title ?? "",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }, childCount: info.length),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}

class Info {
  String? title;
  String? img;

  Info({this.title, this.img});

  factory Info.fromJson(Map<String, dynamic> json) =>
      Info(title: json["title"], img: json["img"]);
}
