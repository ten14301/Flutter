import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final List selectedItem;
  final String startdate;
  final String enddate;

  PaymentPage({
    required this.selectedItem,
    required this.startdate,
    required this.enddate,
  });

  @override
  Widget build(BuildContext context) {
    DateTime start = DateTime.parse(startdate);
    DateTime end = DateTime.parse(enddate);
    int daysDifference = end.difference(start).inDays;
    int selectedItemCount = selectedItem.length;
    int total = daysDifference*(selectedItemCount*500);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ชำระเงิน'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ข้อมูลสินค้า
            const Text(
              'รายละเอียดการชำระเงิน',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            for (var store in selectedItem)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'แผง: ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: '${store.name} ',
                        style: const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      const TextSpan(
                        text: 'ราคา: ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: '${store.price}',
                        style: const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),

            const Divider(height: 30, thickness: 1),
            
            // วันที่เริ่มต้นและสิ้นสุด
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "วันที่เริ่มต้น: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: "$startdate\n",
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const TextSpan(
                    text: "วันที่สิ้นสุด: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: "$enddate",
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
            ),
              RichText( text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'จำนวนวันที่จอง: ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: '$daysDifference วัน\n',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),                
                      const TextSpan(
                        text: 'ที่ต้องจ่าย: ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: '$total บาท',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      ]
                      )
                      ),
            const Spacer(),

            // QR Code สำหรับชำระเงิน
            Center(
              child: Column(
                children: [
                  const Text(
                    'สแกนเพื่อชำระเงิน',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Image.network(
                    'https://img5.pic.in.th/file/secure-sv1/png-transparent-qr-code-information-qr-code-android-qrcode-text-rectangle-monochrome-thumbnail-removebg-preview.png',
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
            ),

            const Spacer(),

            // ปุ่มชำระเงิน
            Center(
              child: ElevatedButton(
                onPressed: () {
          showDialog(
            context: context, 
            builder: (BuildContext context){
              return AlertDialog(
                title: const Text("ชำระเงิน"),
                content: const Text("ชำระเงินเสร็จสิ้น"),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    child: const Text("ตกลง"))
                ],
              );
            });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text(
                    'ชำระเงิน',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
