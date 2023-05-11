class Task {
  String id;
  String title;
  String description;
  int date;
  bool isChecked;

  Task(
      {this.id = '',
      required this.date,
      required this.title,
      required this.description,
      this.isChecked = false});
  Task.FromJson(Map<String, dynamic> json): this(
    id: json['id'] as String,
    date:json['dateTime'] as int ,
    description: json['description'] as String,
    title:json['title'] as String,
    isChecked: json['isChecked'] as bool,
  );
  Map<String , dynamic>toJson(){
    return{
      'id' : id,
      'title' : title,
      'description' : description,
      'dateTime' : date,
      'isChecked' : isChecked,

    };
  }
}
