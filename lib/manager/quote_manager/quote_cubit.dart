import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafka/quotes_apikey.dart';

import '../../models/quote/quote_model.dart';


part 'data_provider.dart';
part 'repository.dart';
part 'quote_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  static QuotesCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<QuotesCubit>(context, listen: listen);

  QuotesCubit() : super(QuotesDefault());

  final repo = QuotesRepository();

  Future<void> fetch() async {
    log("cubit start fetching quotes");
    emit(const QuotesFetchLoading());
    try {

      Duration? difference;
      final currentTime = DateTime.now();
      List<Quote>? data = [];

      data = await repo.fetchHive();
      DateTime? quotesTime = Hive.box('app').get('quotesTime');
      if (quotesTime != null) {
        difference = currentTime.difference(quotesTime);
      }
      if (data == null || (difference != null && difference.inHours > 1)) {
        data = await repo.fetchApi();
      }

      emit(QuotesFetchSuccess(data: data));
    } catch (e) {
      emit(QuotesFetchFailed(message: e.toString()));
    }
  }
}
