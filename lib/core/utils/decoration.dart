import 'package:test_flutter/core/general_export.dart';

extension GradiantContainer on BoxDecoration {
  BoxDecoration decorationGradiantContainer() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          mov,
          lightOrange,
        ],
      ),
    );
  }
}
