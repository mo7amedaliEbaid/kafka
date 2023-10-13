import 'dart:convert';

import 'package:hive/hive.dart';


part 'book_model.g.dart';

@HiveType(typeId: 1)
class Book {
  @HiveField(0)
  final String? authors;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? imageLinks;
  @HiveField(4)
  final String? publishedDate;


  Book({
    this.authors,
    this.title,
    this.description,
    this.imageLinks,
    this.publishedDate,
  });

  Book copyWith({
    String? authors,
    String? title,
    String? description,
    String? imageLinks,
    String? publishedDate,
  }) {
    return Book(
      authors: authors ?? this.authors,
      title: title ?? this.title,
      description: description ?? this.description,
      imageLinks: imageLinks ?? this.imageLinks ,
      publishedDate: publishedDate ?? this.publishedDate,
    );
  }

  Book merge(Book model) {
    return Book(
      authors: model.authors ?? authors,
      title: model.title ?? title,
      description: model.description ?? description,
      imageLinks: model.imageLinks ,
      publishedDate: model.publishedDate ?? publishedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authors': authors,
      'title': title,
      'description': description,
      'imageLinks': imageLinks,
      'publishedDate': publishedDate,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return map['imageLinks']==null?
    Book(
      authors: map['authors'][0],
      title: map['title'],
      description: map['description'],
      imageLinks:"https://media.newyorker.com/photos/63b5c3eafa0ce5e2843c3416/master/w_2560%2Cc_limit/230116_r41714.jpg",
      publishedDate: map['publishedDate'],
    ):
      Book(
      authors: map['authors'][0],
      title: map['title'],
      description: map['description'],
      imageLinks: map['imageLinks']["thumbnail"]?? "https://media.newyorker.com/photos/63b5c3eafa0ce5e2843c3416/master/w_2560%2Cc_limit/230116_r41714.jpg",
      publishedDate: map['publishedDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Book( authors: $authors, title: $title, description: $description, imageLinks: $imageLinks, publishedDate: $publishedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Book &&
        other.authors == authors &&
        other.title == title &&
        other.description == description &&
        other.imageLinks == imageLinks &&
        other.publishedDate == publishedDate ;
  }

  @override
  int get hashCode {
    return authors.hashCode ^
    title.hashCode ^
    description.hashCode ^
    imageLinks.hashCode ^
    publishedDate.hashCode;
  }
}
