import 'package:flutter/material.dart';
import 'package:suvannabhumi/storemodel.dart';

class PaymentPage extends StatelessWidget {
  final List<ChooseStore> selectedItem; 
  final String startdate;
  final String enddate;

  const PaymentPage({
    required this.selectedItem,
    required this.startdate,
    required this.enddate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      const Text("หน้าชำระเงิน")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("รายการที่เลือก:"),
            Expanded(
              child: ListView.builder(
                itemCount: selectedItem.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(selectedItem[index].name),
                  );
                },
              ),
            ),
            Text("วันที่เริ่มต้น: $startdate"),
            Text("วันที่สิ้นสุด: $enddate"),
          ],
        ),
      ),
    );
  }
}
