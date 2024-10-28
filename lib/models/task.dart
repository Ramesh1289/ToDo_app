

class Task{
  final int? id;
  final String title;
  final String description;
  final String date;
  final String priority;
  Task({this.id,required this.title,required this.description,required this.date,required this.priority
  });
  factory Task.fromMap(Map<String,dynamic> json)=>Task(
    id:json["id"],
    title: json["title"],
    description: json["description"],
    date: json["date"],
    priority: json["priority"],
  );
  Map<String,dynamic>toMap(){
    return{
    "id":id,
    "title":title,
    "description":description,
    "date":date,
    "priority":priority,
};
}
}
