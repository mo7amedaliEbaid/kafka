part of '../../dashboard.dart';

class _Tabs extends StatelessWidget {
  final MapEntry entry;
  const _Tabs({
    Key? key,
    required this.entry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = Provider.of<TabProvider>(context);
    final isSelected = tabs.index == entry.key;

    return InkWell(
      onTap: () => tabs.index = entry.key,
      child: AnimatedContainer(
        height: AppDimensions.normalize(15),
        padding: Space.h,
        duration: const Duration(milliseconds: 350),
        decoration: BoxDecoration(
          color: !isSelected ? Colors.grey : Colors.amber.shade900,
        ),
        child: Center(
          child: Text(
            entry.value,
            style: isSelected
                ? AppText.b1b!.copyWith(
              color: Colors.white,
            )
                : AppText.b1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
