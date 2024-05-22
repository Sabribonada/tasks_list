class Task {
  late final String title;
  late bool done;

  Task(this.title, {this.done = false});

  Task.fromJson(Map<String, dynamic> json){
    title = json['title'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    return{
      'title': title,
      'done': done
    };
  }
}