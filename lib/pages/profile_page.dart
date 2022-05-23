import 'package:flutter/material.dart';
import 'package:flutter_fincance/json/profile_json.dart';
import 'package:flutter_fincance/theme/color.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.03),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.height,
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3)
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 60,
                right: 20,
                left: 20,
                bottom: 25,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Perfil",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(AntDesign.setting)
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Container(
                        width: (size.width - 40) * 0.4,
                        child: Container(
                          child: Stack(
                            children: [
                              RotatedBox(
                                quarterTurns: -2,
                                child: CircularPercentIndicator(
                                  circularStrokeCap: CircularStrokeCap.round,
                                  backgroundColor: grey.withOpacity(0.3),
                                  radius: 110.0,
                                  lineWidth: 6.0,
                                  percent: 0.53,
                                  progressColor: primary,
                                ),
                              ),
                              Positioned(
                                top: 13,
                                left: 12,
                                child: Container(
                                  width: 85,
                                  height: 85,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(profileUrl),
                                          fit: BoxFit.cover)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: (size.width - 40) * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(email,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: black.withOpacity(0.4)))
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: grey.withOpacity(0.01),
                              spreadRadius: 10,
                              blurRadius: 3)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 25, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Fazer backup com o ",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Google Drive",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: white)),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Backup",
                                style: TextStyle(color: white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
