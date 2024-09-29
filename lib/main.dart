import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'storecontainer.dart';
import 'payment.dart';
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
  List<ChooseStore> sStore = [];

  void _addStore(String name, int price,bool isSelected) {
    setState(() {

    final item = ChooseStore(name, price);

    if (isSelected) {

      if (!sStore.any((store) => store.name == name && store.price == price)) {
        sStore.add(item);
      }
    } else {
      sStore.removeWhere((store) => store.name == name && store.price == price);
    }
    });
  }
  TextEditingController dateControllerBefore = TextEditingController();
  TextEditingController dateControllerAfter = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
      child: Padding(
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
          ),
          const SizedBox(height: 15,),
          TextField(
              controller: dateControllerBefore,
              decoration: const InputDecoration(
                labelText: "กรุ่ณาเลือกวันที่เริ่มต้น",
                filled: true,
                prefixIcon: Icon(Icons.calendar_today),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
              ),
              readOnly: true,
              onTap: () {
                selectDateBefore();
              },
          ),
          const SizedBox(height: 15,),
          TextField(
              controller: dateControllerAfter,
              decoration: const InputDecoration(
                labelText: "กรุ่ณาเลือกวันที่สุดท้าย",
                filled: true,
                prefixIcon: Icon(Icons.calendar_today),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
              ),
              readOnly: true,
              onTap: () {
                selectDateAfter();
              },
          ),
          const SizedBox(height: 25,),
          GestureDetector(
          onTap: (){
              if (dateControllerBefore.text.isNotEmpty &&
      dateControllerAfter.text.isNotEmpty &&
      sStore.isNotEmpty){
            Navigator.push(
              context
              , 
              MaterialPageRoute(
                builder: (context) => PaymentPage(
                  selectedItem: sStore,
                  startdate: dateControllerBefore.text,
                  enddate: dateControllerAfter.text
                )
                )
              );
      }
        else{
          showDialog(
            context: context, 
            builder: (BuildContext context){
              return AlertDialog(
                title: const Text("ข้อมูลไม่ครบ"),
                content: const Text("กรุณากรอกข้อมูลให้ครบถ้วน"),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    child: const Text("ตกลง"))
                ],
              );
            });
         }
          },
          child:Container(
            width: 150,
            height: 50,
            color: const Color.fromARGB(255, 255, 75, 62),
            child: Center(
            child: Text("ตกลง",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSansThai(
              textStyle: const TextStyle(
                  color: Colors.black, 
                  letterSpacing: .5, 
                  fontSize: 20,

            ),
            )
            ),
            ),
            
          )
          ),
        ]),
      ),
      ),
    );
  }
  //selectDateBefore
  Future<void> selectDateBefore() async{
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), 
      lastDate: DateTime(2100)
      );
    if (picked != null){
      setState(() {
        dateControllerBefore.text = picked.toString().split(" ")[0];
      });
    }
  }
  //
  Future<void> selectDateAfter() async{
    DateTime ? dateBefore;
    if(dateControllerBefore.text.isNotEmpty){
       dateBefore = DateTime.parse(dateControllerBefore.text);
    }

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), 
      lastDate: DateTime(2100)
      );
    if (picked != null){
      if(dateBefore != null && picked.isBefore(dateBefore)){
        if(mounted){
        showDialog(
        context: context, 
        builder: (BuildContext context ){
          return AlertDialog(
            title: const Text("วันที่ของคุณไม่ถูกต้อง"),
            content: const Text("วันที่สุดท้ายต้องมากกว่าหรือเท่ากับวันที่เริ่มต้น"),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                }, 
                child: const Text("ตกลง"))
            ],
          );

        });
        }
        
      }
      else{
      setState(() {
        dateControllerAfter.text = picked.toString().split(" ")[0];
      });
      }
    }
  }
  //
}
