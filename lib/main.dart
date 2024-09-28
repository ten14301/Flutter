import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'storecontainer.dart';
import 'storemodel.dart';

void main() {
  var app = const MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Storemenu> smenu = [
    Storemenu("A1", 500, "assets/images/Store.png"),
    Storemenu("B1", 500, "assets/images/Store.png")
  ];
  List<ChooseStore> sStore = [];

  void _addStore(String name, int price) {
    setState(() {
      sStore.add(ChooseStore(name, price));
      for (var store in sStore) {
        print("${store.name},${store.price}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(children: [
          Text(
            "กรุณาเลือกแผงที่ต้องการจอง",
            style: GoogleFonts.notoSansThai(
              textStyle: const TextStyle(
                  color: Colors.black, letterSpacing: .5, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: const Color.fromARGB(255, 227, 225, 225),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Storecontainer(
                  name: "A1",
                  price: 500,
                  color: Colors.green,
                  onPriceSelected: _addStore,
                ),
                Storecontainer(
                  name: "A2",
                  price: 500,
                  color: Colors.green,
                  onPriceSelected: _addStore,
                ),
                Storecontainer(
                  name: "A3",
                  price: 500,
                  color: Colors.green,
                  onPriceSelected: _addStore,
                )
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 227, 225, 225),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Storecontainer(
                  name: "A4",
                  price: 500,
                  color: Colors.green,
                  onPriceSelected: _addStore,
                ),
                Storecontainer(
                  name: "A5",
                  price: 500,
                  color: Colors.green,
                  onPriceSelected: _addStore,
                ),
                Storecontainer(
                  name: "A6",
                  price: 600,
                  color: Colors.green,
                  onPriceSelected: _addStore,
                )
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 227, 225, 225),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Storecontainer(
                  name: "A7",
                  price: 500,
                  color: Colors.green,
                  onPriceSelected: _addStore,
                ),
                Storecontainer(
                  name: "A8",
                  price: 500,
                  color: Colors.green,
                  onPriceSelected: _addStore,
                ),
                Storecontainer(
                  name: "A9",
                  price: 600,
                  color: Colors.green,
                  onPriceSelected: _addStore,
                )
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 227, 225, 225),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Storecontainer(
                  name: "A10",
                  price: 500,
                  color: Colors.green,
                  onPriceSelected: _addStore,
                ),
                Storecontainer(
                  name: "A11",
                  price: 500,
                  color: Colors.green,
                  onPriceSelected: _addStore,
                ),
                Storecontainer(
                  name: "A12",
                  price: 600,
                  color: Colors.green,
                  onPriceSelected: _addStore,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
