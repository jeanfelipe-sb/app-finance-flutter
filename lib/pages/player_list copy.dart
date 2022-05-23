import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  int activateDay = 4;
  final TextEditingController _filter = new TextEditingController();
  List<String> itemList = [
    "Item1",
    "Item1",
    "Item1",
    "Item1",
    "Item1",
    "Item1",
    "Item1",
    "Item1",
    "Item1",
    "Item1",
    "Item1",
    "Item1",
    "Item1",
    "Item1"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              createSilverAppBar1(),
              createSilverAppBar2(),
            ];
          },
          body: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(itemList[index]),
                  ),
                );
              })),
    );
  }

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      backgroundColor: Colors.redAccent,
      expandedHeight: 300,
      floating: false,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Container(
            color: Colors.white,
            child: Image.network('https://picsum.photos/250?image=9',
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }

  SliverAppBar createSilverAppBar2() {
    return SliverAppBar(
      backgroundColor: Colors.redAccent,
      pinned: true,
      title: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(1.1, 1.1),
                blurRadius: 5.0),
          ],
        ),
        child: CupertinoTextField(
          controller: _filter,
          keyboardType: TextInputType.text,
          placeholder: 'Search',
          placeholderStyle: TextStyle(
            color: Color(0xffC4C6CC),
            fontSize: 14.0,
            fontFamily: 'Brutal',
          ),
          prefix: Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
            child: Icon(
              Icons.search,
              size: 18,
              color: Colors.black,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
