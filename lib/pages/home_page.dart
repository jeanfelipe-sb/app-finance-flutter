import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fincance/json/day_month.dart';
import 'package:flutter_fincance/theme/color.dart';
import 'package:flutter_fincance/widgets/chart.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activateDay = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.04),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    List expenses = [
      {
        "icon": Icons.arrow_back,
        "color": red,
        "label": "Despesas",
        "cost": "R\$ 604,44",
      },
      {
        "icon": Icons.arrow_forward,
        "color": blue,
        "label": "Receitas",
        "cost": "R\$ 504,44",
      },
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3)
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, bottom: 25, right: 21, left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Princial",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(AntDesign.search1)
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(days.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activateDay = index;
                            });
                          },
                          child: Container(
                            width: (size.width - 40) / 8,
                            child: Column(
                              children: [
                                Text(
                                  days[index]['label'],
                                  style: const TextStyle(fontSize: 10),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: activateDay == index
                                          ? primary
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: activateDay == index
                                              ? primary
                                              : black.withOpacity(0.1))),
                                  child: Center(
                                    child: Text(
                                      days[index]['day'],
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: activateDay == index
                                            ? white
                                            : black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.01),
                        spreadRadius: 10,
                        blurRadius: 3)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total em contas",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: black.withOpacity(0.5)),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "R\$ 3.030,35",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: size.width - 20,
                        height: 150,
                        child: LineChart(mainData()),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 20,
            children: List.generate(2, (index) {
              return Container(
                width: (size.width - 60) / 2,
                height: 170,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: grey.withOpacity(0.01),
                          spreadRadius: 10,
                          blurRadius: 3)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: expenses[index]['color'], shape: BoxShape.circle),
                        child: Center(
                          child: Icon(expenses[index]['icon'], color: white),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expenses[index]['label'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: black.withOpacity(0.5)),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              expenses[index]['cost'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ])
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
