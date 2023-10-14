import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/book_model.dart';


part 'data_provider.dart';
part 'repository.dart';
part 'book_state.dart';

class BooksCubit extends Cubit<BooksState> {
  static BooksCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<BooksCubit>(context, listen: listen);

  BooksCubit() : super(BooksDefault());

  final repo = BooksRepository();

  Future<void> fetch({String? keyword}) async {
    emit(const BooksFetchLoading());
    try {
      keyword ??= 'latest';

      Duration? difference;
      final currentTime = DateTime.now();
      List<Book>? data = [];

      data = await repo.fetchHive(keyword);
      DateTime? booksTime = Hive.box('app').get('booksTime');
      if (booksTime != null) {
        difference = currentTime.difference(booksTime);
      }
      if (data == null || (difference != null && difference.inHours > 1)) {
        data = await repo.fetchApi(keyword);
      }

      emit(BooksFetchSuccess(data: data));
    } catch (e) {
      emit(BooksFetchFailed(message: e.toString()));
    }
  }
}
