
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafka/manager/cubit.dart';
import 'package:kafka/screens/book_details/book_detail.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../configs/app.dart';
import '../../../../configs/app_dimensions.dart';
import '../../../../configs/app_theme.dart';
import '../../../../configs/space.dart';
import '../../configs/app_typography.dart';
import '../../models/book_model.dart';
import '../../responsive/responsive.dart';


part 'views/mobile.dart';
part 'views/desktop.dart';
part 'views/tablet.dart';

part 'views/widgets/_shimmer_book_card.dart';
part 'views/widgets/_book_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    final booksCubit = BlocProvider.of<BooksCubit>(context);


    if (booksCubit.state.data == null || booksCubit.state.data!.isEmpty) {
      booksCubit.fetch(keyword: 'latest');
    }
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: DashboardMobile(),
      tablet: DashboardTablet(),
      desktop: DashboardDesktop(),
    );
  }
}
