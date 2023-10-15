part of 'dashboard.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final tabs = Provider.of<TabProvider>(context);
    Future<bool> _onWillPop() async {
      return (await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                "Exit Application",
              ),
              content: const Text(
                "Are You Sure?",
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                TextButton(
                  child: const Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          )) ??
          false;
    }

    final List<Widget> views = const [
      _BooksView(),
      _QuotesView(),
    ];

    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "KAFKA",
              style: AppText.h2b,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: AppUtils.tabsLabel
                    .asMap()
                    .entries
                    .map(
                      (e) => _Tabs(
                    entry: e,
                  ),
                )
                    .toList(),
              ),
              Space.x!,
              GestureDetector(
                onTap: () {
                  themeProvider.theme = !themeProvider.theme;
                },
                child: Icon(
                  Icons.brightness_6_outlined,
                  size: AppDimensions.normalize(14),
                  color: themeProvider.isDark ? Colors.yellow : Colors.grey.shade800,
                ),
              ),
              Space.x2!
            ],
            automaticallyImplyLeading: false,
          ),
          body: views[tabs.index]
        ),
      ),
    );
  }
}
