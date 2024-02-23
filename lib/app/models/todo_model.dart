
import 'dart:convert';

class TodoModel {
  String id;
  String title;
  String description;
  String status;
  int creationData;
  String? imageUrl;
  bool isCompleted;
  int? dueDate;
  String difficulityLevel;
  String priority;
  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.creationData,
    this.imageUrl,
    required this.isCompleted,
    this.dueDate,
    required this.difficulityLevel,
    required this.priority,
  });

  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
    String? status,
    int? creationData,
    String? imageUrl,
    bool? isCompleted,
    int? dueDate,
    String? difficulityLevel,
    String? priority,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      creationData: creationData ?? this.creationData,
      imageUrl: imageUrl ?? this.imageUrl,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
      difficulityLevel: difficulityLevel ?? this.difficulityLevel,
      priority: priority ?? this.priority,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'creationData': creationData,
      'imageUrl': imageUrl,
      'isCompleted': isCompleted,
      'dueDate': dueDate,
      'difficulityLevel': difficulityLevel,
      'priority': priority,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
      creationData: map['creationData'] as int,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      isCompleted: map['isCompleted'] as bool,
      dueDate: map['dueDate'] != null ? map['dueDate'] as int : null,
      difficulityLevel: map['difficulityLevel'] as String,
      priority: map['priority'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodoModel(id: $id, title: $title, description: $description, status: $status, creationData: $creationData, imageUrl: $imageUrl, isCompleted: $isCompleted, dueDate: $dueDate, difficulityLevel: $difficulityLevel, priority: $priority)';
  }

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.status == status &&
        other.creationData == creationData &&
        other.imageUrl == imageUrl &&
        other.isCompleted == isCompleted &&
        other.dueDate == dueDate &&
        other.difficulityLevel == difficulityLevel &&
        other.priority == priority;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        status.hashCode ^
        creationData.hashCode ^
        imageUrl.hashCode ^
        isCompleted.hashCode ^
        dueDate.hashCode ^
        difficulityLevel.hashCode ^
        priority.hashCode;
  }
}
