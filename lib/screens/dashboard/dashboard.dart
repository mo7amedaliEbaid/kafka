
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafka/manager/book_manager/book_cubit.dart';
import 'package:kafka/manager/quote_manager/quote_cubit.dart';
import 'package:kafka/models/quote/quote_model.dart';
import 'package:kafka/screens/book_details/book_details.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../configs/app.dart';
import '../../../../configs/configs.dart';
import '../../manager/tab_manager/tab_provider.dart';
import '../../manager/theme_manager/theme_provider.dart';
import '../../models/book/book_model.dart';
import '../../utils/app_utils.dart';


part '_body.dart';
part 'views/_quotes_view.dart';
part 'views/_books_view.dart';


part 'views/widgets/_shimmer_book_card.dart';
part 'views/widgets/_book_card.dart';
part 'views/widgets/_tabs.dart';
part 'views/widgets/_quote_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    final booksCubit = BlocProvider.of<BooksCubit>(context);
    final quotesCubit = BlocProvider.of<QuotesCubit>(context);


    if (booksCubit.state.data == null || booksCubit.state.data!.isEmpty) {
      booksCubit.fetch();
    }

    if (quotesCubit.state.data == null || quotesCubit.state.data!.isEmpty) {
      quotesCubit.fetch();
    }
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return  DashboardBody();
  }
}
