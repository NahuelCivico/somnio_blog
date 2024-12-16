class Post {
  final int id;
  final String title;
  final String description;

  Post({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] != null ? map['id'] as int : 0,
      title: map['title'] != null ? map['title'] as String : '',
      description: map['body'] != null ? map['body'] as String : '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  Post copyWith({
    String? title,
    String? description,
  }) {
    return Post(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.title == title && other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;

  @override
  String toString() => 'Post(title: $title, description: $description)';
}
