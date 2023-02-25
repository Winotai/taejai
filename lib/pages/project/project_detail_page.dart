import 'package:flutter/material.dart';
import 'package:taejai/models/project.dart';
import 'package:intl/intl.dart';

var title = const TextStyle(
  fontSize: 20.0,
  color: Colors.black54,
  overflow: TextOverflow.ellipsis,
);
var receiveAmountStyle = const TextStyle(
  fontSize: 15.0,
  color: Colors.orange,
  overflow: TextOverflow.ellipsis,
);
var descriptionStyle = const TextStyle(
  fontSize: 12.0,
  color: Colors.black54,
  overflow: TextOverflow.ellipsis,
);
var amountStyle = const TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: Colors.black54,
);

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,000');
    var amount = formatter.format(project.receiveAmount);
    var target = formatter.format(project.targetAmount);
    var percentText = ((project.receiveAmount /project.targetAmount)*100).toStringAsFixed(0);
    var percent = int.tryParse(percentText);
    return Scaffold(
      appBar: AppBar(
          title: Text(
          project.title,
          overflow: TextOverflow.ellipsis,
      )),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(project.title),
                const SizedBox(height: 10.0),
                Image.asset(
                  project.imageUrl,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10.0),
                Text(project.description),
                const SizedBox(height: 10.0),
                Text('ระยะเวลาโครงการ '+ project.time),
                const SizedBox(height: 10.0),
                Text('พื้นที่ดำเนินโครงการ '+ project.area),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text('ยอดบริจาคขณะนี้'),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(' ' + amount.toString() + ' บาท',style: receiveAmountStyle),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('เป้าหมาย', style: descriptionStyle),
                          const SizedBox(height: 5.0),
                          Text('$target บาท', style: amountStyle),
                        ],
                      ),
                    ),
                    Text('$percentText%', style: descriptionStyle),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: percent!,
                        child: Container(
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 0.0),
                          color: Colors.orange,
                        ),
                      ),
                      Expanded(
                        flex: 100-percent,
                        child: Container(
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 0.0),
                          color: const Color(0xFFE8E8E8), //Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${project.duration} วัน', style: descriptionStyle),
                      Row(
                        children: [
                          const Icon(Icons.person, size: 14.0),
                          Text('${project.donateCount}',
                              style: descriptionStyle),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(flex :1,
                      child: OutlinedButton(
                        onPressed: () {
                          //todo:
                        },
                        child: Text('💚 ร่วมบริจาค'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(flex :1,
                      child: OutlinedButton(
                        onPressed: () {
                          //todo:
                        },
                        child: Text('🤍 หยิบใส่ตะกร้า'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('แชร์ให้เพื่อน',),
                    //Icon(Icons.shopping_cart_outlined),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.line_style),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.facebook_sharp),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.tab),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}