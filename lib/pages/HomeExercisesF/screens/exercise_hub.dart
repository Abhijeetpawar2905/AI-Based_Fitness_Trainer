
// ExerciseHub class used to build exercises list 
class ExerciseHub {
  List<Exercises> exercises = [];

  // Constructor
  ExerciseHub({required this.exercises});

  // Create List of Exercises from Json 
  ExerciseHub.fromJson(Map<String, dynamic> json) {
    if (json['exercises'] != null) {
      exercises = <Exercises>[];
      json['exercises'].forEach((v) {
        exercises.add(Exercises.fromJson(v));
      });
    }
  }

  // Convert Exercises List to Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (exercises != null) {
      data['exercises'] = exercises.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// display Json data in the app
class Exercises {
  late String id;
  late String title;
  late String thumbnail;
  late String gif;
  late String seconds;

  // Constructor
  Exercises({required this.id, required this.title, required this.thumbnail, required this.gif, required this.seconds});

  // Get Data from Json and save in attributes of object
  Exercises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    gif = json['gif'];
    seconds = json['seconds'];
  }

  //Convert data to Json from the attributes of object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['gif'] = this.gif;
    data['seconds'] = this.seconds;
    return data;
  }
}