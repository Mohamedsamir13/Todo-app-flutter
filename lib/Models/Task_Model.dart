class TaskModel {
  final int id;
  final String title;
  final String date;
  final String time;
  final String status;
  const TaskModel({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json["id"],
        title: json["title"],
        date: json["date"],
        time: json["time"],
        status: json["status"]);
  }
}