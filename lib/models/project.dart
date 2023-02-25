class Project {
  final String title; //ชื่อโครงการ
  final String description; //คำอธิบาย
  final int targetAmount; //ยอดเงินบริจาคที่ต้องการ
  final int duration; //ระยะเวลา
  final int receiveAmount; //จำนวนที่ได้รับบริจาคมาแล้ว
  final int donateCount; //จำนวนครั้งที่มีการบริจาค
  final String imageUrl; //URL ของภาพ cover
  final String time; //ระยะเวลาโครงการ
  final String area; //พื้นที่ดำเนินโครงการ

  Project({
      required this.title,
      required this.description,
      required this.targetAmount,
      required this.duration,
      required this.receiveAmount,
      required this.donateCount,
      required this.imageUrl,
      required this.time,
      required this.area,
  });
}
