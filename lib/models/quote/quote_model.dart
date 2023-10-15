import 'dart:convert';

import 'package:hive/hive.dart';

part 'quote_model.g.dart';

@HiveType(typeId: 0)
class Quote {
  @HiveField(0)
  final String? quote;

  Quote({
    this.quote,
  });

  Quote copyWith({
    String? quote,
  }) {
    return Quote(
      quote: quote ?? this.quote,
    );
  }

  Quote merge(Quote model) {
    return Quote(
      quote: model.quote ?? quote,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quote': quote,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      quote: map['quote'],
    );
  }


  @override
  String toString() {
    return 'Book( quote: $quote)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quote && other.quote == quote;
  }

  @override
  int get hashCode {
    return quote.hashCode;
  }
}
