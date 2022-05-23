import 'package:flutter/material.dart';
import 'package:flutter_fincance/json/day_month.dart';
import 'package:flutter_fincance/json/transactions_json.dart';
import 'package:flutter_fincance/theme/color.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
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
                        "Transações",
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
                    children: List.generate(
                      days.length,
                      (index) {
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
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: List.generate(
                daily.length,
                (index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: grey.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                daily[index]['icon'],
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: (size.width - 90) * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  daily[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  daily[index]['category'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: black.withOpacity(0.5),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: (size.width - 40) * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  daily[index]['price'],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: green),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  daily[index]['status'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: black.withOpacity(0.5)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8, top: 8),
                        child: Divider(thickness: 0.8),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
