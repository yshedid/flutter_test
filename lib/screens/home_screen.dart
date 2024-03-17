import 'package:cis_test/screens/favorite.dart';
import 'package:cis_test/screens/item_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text("Test"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Favorite(),
                      ));
                },
                icon: const Icon(Icons.favorite_border),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (txt){},
              decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                hintText: "Search for a specific product",
                prefixIcon: const Icon(Icons.search),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Buttons(btn: "button1",fun: (){ setState(() {
                    button1 = true;
                    button2 = false;
                    button3 = false;
                  });},
                    toggle: button1,),
                  Buttons(btn: "button2",fun: (){ setState(() {
                    button1 = false;
                    button2 = true;
                    button3 = false;
                  });},
                    toggle: button2,),
                  Buttons(btn: "button3",fun: (){ setState(() {
                    button1 = false;
                    button2 = false;
                    button3 = true;
                  });},
                    toggle: button3,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (ctx, idx) => MyCard(
                        itemnum: idx,
                      )),
            )
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  int itemnum;

  MyCard({super.key, required this.itemnum});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return (ItemDetails());
          },
        ));
      },
      child: Card(
        elevation: 0.5,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 8, start: 16, end: 16),
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  width: 130,
                  height: 100,
                  child: Image.asset("assets/images/download.jpeg")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ch${itemnum + 1}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  String btn;
  bool toggle;
 void Function() fun;

  Buttons({super.key, required this.btn, required this.fun, required this.toggle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: toggle?Colors.blueAccent:Colors.white),
        onPressed: fun,
        child: Text(
          btn,
          style:  TextStyle(color: toggle?Colors.white:Colors.blueAccent),
        ));
  }
}
