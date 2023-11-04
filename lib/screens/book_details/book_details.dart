import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kafka/responsive/responsive.dart';
import '../../configs/app.dart';
import '../../configs/configs.dart';
import '../../models/book/book_model.dart';

part 'views/_book_detail_mobile.dart';
part 'views/_book_detail_desktop.dart';
part 'views/_book_detail_tablet.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _MobileBookDetailScreen(
        book: book,
      ),
      tablet: _TabletBookDetailScreen(
        book: book,
      ),
      desktop: _DesktopBookDetailScreen(
        book: book,
      ),
    );
  }
}
