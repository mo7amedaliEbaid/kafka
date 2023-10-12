part of '../dashboard.dart';

class DashboardTablet extends StatefulWidget {
  const DashboardTablet({Key? key}) : super(key: key);

  @override
  State<DashboardTablet> createState() => _DashboardTabletState();
}

class _DashboardTabletState extends State<DashboardTablet> {


  @override
  Widget build(BuildContext context) {
    App.init(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Center(
        child: Text("Tablet"),
      )),
    );
  }
}
