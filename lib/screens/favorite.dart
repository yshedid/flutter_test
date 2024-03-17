import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favorite"),
      ),
      body: Column(
        children: [
          Card(
            elevation: 0.5,
            margin: EdgeInsetsDirectional.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset("assets/images/download.jpeg"),
                  ),
                ),
                Text("ch1"),
                SizedBox(
                  width: 200,
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite))
              ],
            ),
          )
        ],
      ),
    );
  }
}
