import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fincance/json/day_month.dart';
import 'package:flutter_fincance/json/transactions_json.dart';
import 'package:flutter_fincance/theme/color.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  int activateMonth = 4;
 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.02),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            createSilverAppBar1(),
            createSilverAppBar2(),
          ];
        }, //List.generate(daily.length, (index) {
        body: ListView.builder(
          itemCount: daily.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
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
              ),
            );
          },
        ),
      ),
    );
  }

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 120,
      floating: false,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Padding(
            padding: const EdgeInsets.only(top: 60, right: 21, left: 20),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
              ],
            ),
          ),
        );
      }),
    );
  }

  SliverAppBar createSilverAppBar2() {
    var size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: white,
      pinned: true,
      title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              5, //months.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      activateMonth = index;
                    });
                  },
                  child: Container(
                    width: (size.width) / 7,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: activateMonth == index
                                  ? primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: activateMonth == index
                                      ? primary
                                      : black.withOpacity(0.1))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 7, bottom: 7, right: 12, left: 12),
                            child: Center(
                              child: Text(
                                months[index]['label'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: activateMonth == index ? white : black,
                                ),
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
          )),
    );
  }
}
