part of '../dashboard.dart';

class DashboardDesktop extends StatefulWidget {
  const DashboardDesktop({Key? key}) : super(key: key);

  @override
  State<DashboardDesktop> createState() => _DashboardDesktopState();
}

class _DashboardDesktopState extends State<DashboardDesktop> {
  @override
  Widget build(BuildContext context) {
    App.init(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Center(
        child: Text("Desktop"),
      )),
    );
  }
}
