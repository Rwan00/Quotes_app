import 'package:flutter/material.dart';
import 'package:qoutes/core/utils/app_colors.dart';

class CustomErrorWidget extends StatelessWidget {
  final void Function() onPressed;
  const CustomErrorWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 15,
      children: [
        Icon(
          Icons.warning_amber_outlined,
          size: 48,
          color: AppColors.primaryColor,
        ),
        Text(
          "Something Went Wrong",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text("Please Try Again", style: Theme.of(context).textTheme.bodySmall),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
          ),
          child: Text("Reload Screen"),
        ),
      ],
    );
  }
}
