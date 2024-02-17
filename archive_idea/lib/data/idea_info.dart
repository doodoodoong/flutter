class IdeaInfo {
  int? id;
  String title;
  String motive;
  String content;
  int priority;
  String feedback;
  int createdAt;

  IdeaInfo({
    this.id,
    required this.title,
    required this.motive,
    required this.content,
    required this.createdAt,
    required this.feedback,
    required this.priority,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'motive': motive,
      'content': content,
      'createdAt': createdAt,
      'feedback': feedback,
      'priority': priority,
    };
  }

  factory IdeaInfo.fromMap(Map<String, dynamic> map) {
    return IdeaInfo(
      id: map['id'],
      title: map['title'],
      motive: map['motive'],
      content: map['content'],
      createdAt: map['createdAt'],
      feedback: map['feedback'],
      priority: map['priority'],
    );
  }
}
