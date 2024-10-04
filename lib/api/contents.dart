class Article {
  String? title;
  String? description;
  String? content;
  String? url;
  String? image;
  String? publishedAt;
  Source? source; // Assuming there is a Source class for 'source'

  // Constructor
  Article({
    this.title,
    this.description,
    this.content,
    this.url,
    this.image,
    this.publishedAt,
    this.source,
  });

  // Factory constructor for creating an instance from JSON
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      content: json['content'],
      url: json['url'],
      image: json['image'],
      publishedAt: json['publishedAt'],
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
    );
  }

  // Method to convert an instance into JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'content': content,
      'url': url,
      'image': image,
      'publishedAt': publishedAt,
      'source': source?.toJson(), // Null-aware operator
    };
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
