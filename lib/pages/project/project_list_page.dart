import 'package:flutter/material.dart';
import 'package:taejai/models/project.dart';
import 'package:intl/intl.dart';
import 'package:taejai/pages//project/project_detail_page.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  List<Project> projects = [
    Project(
        title: 'อิ่มท้องน้องพิเศษ',
        description:
        'ชวนมอบมื้ออาหารกลางวันให้เด็กพิเศษ 240 คนในมูลนิธิบ้านครูบุญชูเพื่อเด็กพิเศษ ที่ต้องเผชิญค่าใช้จ่ายด้านอาหารกลางวันหลักแสนต่อเดือน เงินจำนวน 3,500 บาทสามารถเลี้ยงอาหารทุกคนได้ 1 มื้อ',
        targetAmount: 119350,
        duration: 22,
        receiveAmount: 50000,
        donateCount: 200,
        imageUrl: 'assets/images/01.jpg',
        time: '06 ก.พ. 2566 ถึง 06 มี.ค. 2566',
        area: 'ระบุพื้นที่: ตำบลพลูตาหลวง อำเภอสัตหีบ จังหวัดชลบุรี (มูลนิธิบ้านครูบุญชูเพื่อเด็กพิเศษ)'),
    Project(
        title: 'กองทุนส่งเสริมเขตอนุรักษ์ทะเลโดยชุมชนประมงพื้นบ้าน',
        description:
        'ร่วมเทใจให้ทะเลบ้านเรา สนับสนุนชุมชนประมงพื้นบ้านให้เป็นผู้เฝ้าระวัง ดูแล และฟื้นฟูธรรมชาติในทะเลรอบๆชุมชนให้กลับมาสมบูรณ์และสวยงาม ให้คนไทยเข้าถึงอาหารทะเลที่ปลอดภัย ต่อยอดการท่องเที่ยวเชิงอนุรักษ์',
        targetAmount: 1719300,
        duration: 16,
        receiveAmount: 350000,
        donateCount: 500,
        imageUrl: 'assets/images/02.jpg',
        time: '27 พ.ย. 2565 ถึง 29 พ.ย. 2566',
        area: 'ทั่วประเทศ'),
    Project(
        title: 'ทุนการศึกษาเพื่อนักเรียนชาวเขา',
        description:
        'ร่วมส่งเสริมการศึกษาและพัฒนานักเรียนชาวเขาและนักเรียนด้อยโอกาส''ระยะเวลาโครงการ 01 ก.พ. 2566 ถึง 30 พ.ย. 2566',
        targetAmount: 1056000,
        duration: 291,
        receiveAmount: 300000,
        donateCount: 250,
        imageUrl: 'assets/images/03.jpg',
        time: '01 ก.พ. 2566 ถึง 30 พ.ย. 2566',
        area: 'ระบุพื้นที่: ตำบลห้วยแก้ว อำเภอแม่ออน จังหวัดเชียงใหม่ , ตำบลหนองหาร อำเภอสันทราย จังหวัดเชียงใหม่ , ตำบลดอนแก้ว อำเภอแม่ริม จังหวัดเชียงใหม่ , ตำบลในเมือง อำเภอเมืองพิษณุโลก จังหวัดพิษณุโลก , ตำบลบ้านต๋อม อำเภอเมืองพะเยา จังหวัดพะเยา , ตำบลช้างเผือก อำเภอเมืองเชียงใหม่ จังหวัดเชียงใหม่ , ตำบลปางหมู อำเภอเมืองแม่ฮ่องสอน จังหวัดแม่ฮ่องสอน , ตำบลชมพู อำเภอเมืองลำปาง จังหวัดลำปาง'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เทใจ')),
      body: ListView.builder(
        itemCount:projects.length,
        //Callback function
        itemBuilder: (BuildContext context, int index) {
          var project = projects[index];

          var descriptionstyle = const TextStyle(
              fontSize: 12.0, color: Colors.black54,
              overflow: TextOverflow.ellipsis);
          var amountstyle = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black54);
          var formatter = NumberFormat('#,###,000');
          var target = formatter.format(project.targetAmount);
          var percentText = ((project.receiveAmount /project.targetAmount)*100).toStringAsFixed(0);
          var percent = int.tryParse(percentText);
          //var title = projects.title;
          //var description = projects.description;
          return Card(
              child: InkWell(
                onTap: () {
                  _handleClickProjectItem(projects[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            project.imageUrl,
                            width: 60.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(project.title),
                                const SizedBox(height: 8.0),
                                Text(project.description, style: descriptionstyle,maxLines: 3,),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('เป้าหมาย', style: descriptionstyle),
                              Text('$target บาท', style: amountstyle),
                            ],
                          ),
                          Text('$percentText%', style: descriptionstyle),
                          ],
                      ),
                      Row(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${project.duration} วัน', style: descriptionstyle),
                          Row(
                            children: [
                              const Icon(Icons.person, size: 14.0),
                              Text('${project.donateCount}', style: descriptionstyle),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
          );
        },
      ),
    );
  }

  void _handleClickProjectItem(Project p){
    //var p = project[index];
    print(p.targetAmount.toString());

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProjectDetailsPage(project: p)),
    );
  }
}
