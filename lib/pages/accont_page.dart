import 'package:flutter/material.dart';
import 'package:flutter_fincance/json/day_month.dart';
import 'package:flutter_fincance/json/accont_json.dart';
import 'package:flutter_fincance/theme/color.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AccontPage extends StatefulWidget {
  const AccontPage({Key? key}) : super(key: key);

  @override
  _AccontPageState createState() => _AccontPageState();
}

class _AccontPageState extends State<AccontPage> {
  int activateDay = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.04),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_chart, size: 25),
        backgroundColor: blue,
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.22,
          width: size.width,
          decoration: BoxDecoration(color: white, boxShadow: [
            BoxShadow(
                color: grey.withOpacity(0.01), spreadRadius: 10, blurRadius: 3)
          ]),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 60, bottom: 25, right: 21, left: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Contas",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: black),
                    ),
                    Icon(AntDesign.search1),
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
                                      color:
                                          activateDay == index ? white : black,
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
        Container(
          height: size.height * 0.71,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                'Saldo atual',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: black.withOpacity(0.6),
                                    fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                'R\$ 3.000,00',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                'Previsão mensal',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: black.withOpacity(0.6),
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'R\$ 3.180,00',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: black.withOpacity(0.7),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25, right: 20, bottom: 8),
                  child: Divider(thickness: 0.8),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: List.generate(accont.length, (index) {
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
                                    accont[index]['icon'],
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
                                      accont[index]['name'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Previsão",
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      accont[index]['ballance'],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: green),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      accont[index]['forecast'],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
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
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
