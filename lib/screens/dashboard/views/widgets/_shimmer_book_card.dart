part of '../../dashboard.dart';

class _ShimmerBookCard extends StatelessWidget {

  const _ShimmerBookCard({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.normalize(3)),
      child: Shimmer.fromColors(
        highlightColor: Colors.grey[300]!,
        baseColor: AppTheme.c!.background!,
        child: Container(
          height: AppDimensions.normalize(65),
          width: double.infinity,
          margin: Space.all(0, 0.35),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppDimensions.normalize(3)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 10),
                blurRadius: 12,
                spreadRadius: 6.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
