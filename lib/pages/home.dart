import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training/colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info = json.decode(value)["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Column(
            children: [
              const HomeAppBar(),
              const SizedBox(
                height: 30,
              ),
              const DetailsBar(),
              const SizedBox(
                height: 20,
              ),
              const NextWorkoutCard(),
              const SizedBox(
                height: 5,
              ),
              const KeepItUpCard(),
              const SizedBox(
                height: 10,
              ),
              FocusArea(info: info)
            ],
          ),
        ),
      ),
    );
  }
}

class FocusArea extends StatelessWidget {
  const FocusArea({
    super.key,
    required this.info,
  });

  final List info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Area of focus",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: color.AppColor.homePageTitle),
            ),
          ],
        ),
        Expanded(
            child: OverflowBox(
          maxWidth: MediaQuery.of(context).size.width,
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
                itemCount: info.length.toDouble() ~/ 2, //2
                itemBuilder: (_, i) {
                  int a = 2 * i; // 0, 2
                  int b = 2 * i + 1; // 1, 3
                  return Row(
                    children: [
                      Container(
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          height: 170,
                          margin: const EdgeInsets.only(
                              left: 30, bottom: 15, top: 15),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(3, 3),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.3)),
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(-3, -3),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.3))
                              ]),
                          child: Center(
                              child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              info[a]["title"],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: color.AppColor.homePageDetail),
                            ),
                          ))),
                      Container(
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          height: 170,
                          margin: const EdgeInsets.only(
                              left: 30, bottom: 15, top: 15),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(3, 3),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.3)),
                                BoxShadow(
                                    blurRadius: 3,
                                    offset: const Offset(-3, -3),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.3))
                              ]),
                          child: Center(
                              child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              info[b]["title"],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: color.AppColor.homePageDetail),
                            ),
                          ))),
                    ],
                  );
                }),
          ),
        )),
      ],
    );
  }
}

class KeepItUpCard extends StatelessWidget {
  const KeepItUpCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 30),
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage("assets/card.jpg"), fit: BoxFit.fill),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 40,
                      offset: const Offset(8, 10),
                      color: color.AppColor.gradientSecond.withOpacity(0.3)),
                  BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(-1, -5),
                      color: color.AppColor.gradientSecond.withOpacity(0.3))
                ]),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(right: 200, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  const DecorationImage(image: AssetImage("assets/card.jpg")),
            ),
          ),
          Container(
              width: double.maxFinite,
              height: 100,
              margin: const EdgeInsets.only(left: 150, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You are doing great",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color.AppColor.homePageDetail),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Keep it up\n",
                          style: TextStyle(
                              color: color.AppColor.homePagePlanColor,
                              fontSize: 16),
                          children: const [
                        TextSpan(text: "stick to your plan")
                      ]))
                ],
              ))
        ],
      ),
    );
  }
}

class NextWorkoutCard extends StatelessWidget {
  const NextWorkoutCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff0f17ad),
            Color(0xFF6985e8),
          ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(80)),
          boxShadow: [
            BoxShadow(
                offset: Offset(5, 10), blurRadius: 20, color: Color(0xFF6985e8))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Next workout",
              style: TextStyle(
                  fontSize: 16,
                  color: color.AppColor.homePageContainerTextSmall)),
          const SizedBox(
            height: 5,
          ),
          Text("Legs Toning",
              style: TextStyle(
                  fontSize: 25,
                  color: color.AppColor.homePageContainerTextSmall)),
          Text("and Glutes Workout",
              style: TextStyle(
                  fontSize: 25,
                  color: color.AppColor.homePageContainerTextSmall)),
          const SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(Icons.timer,
                      size: 20,
                      color: color.AppColor.homePageContainerTextSmall),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("60 minutes",
                      style: TextStyle(
                          fontSize: 14,
                          color: color.AppColor.homePageContainerTextSmall)),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                          color: color.AppColor.gradientFirst,
                          blurRadius: 10,
                          offset: const Offset(4, 8))
                    ]),
                child: const Icon(Icons.play_circle,
                    size: 70, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DetailsBar extends StatelessWidget {
  const DetailsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Your program",
            style: TextStyle(
                fontSize: 20,
                color: color.AppColor.homePageSubtitle,
                fontWeight: FontWeight.w700)),
        Expanded(
          child: Container(),
        ),
        Text("Details",
            style: TextStyle(
              fontSize: 20,
              color: color.AppColor.homePageDetail,
            )),
        const SizedBox(
          width: 10,
        ),
        Icon(
          Icons.arrow_forward,
          size: 20,
          color: color.AppColor.homePageIcons,
        ),
      ],
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Training",
          style: TextStyle(
              fontSize: 30,
              color: color.AppColor.homePageTitle,
              fontWeight: FontWeight.w700),
        ),
        Expanded(
          child: Container(),
        ),
        Icon(Icons.arrow_back_ios,
            size: 20, color: color.AppColor.homePageIcons),
        const SizedBox(
          width: 10,
        ),
        Icon(Icons.calendar_today_outlined,
            size: 20, color: color.AppColor.homePageIcons),
        const SizedBox(
          width: 15,
        ),
        Icon(Icons.arrow_forward_ios,
            size: 20, color: color.AppColor.homePageIcons),
      ],
    );
  }
}
