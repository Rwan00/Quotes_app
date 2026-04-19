import 'package:flutter/material.dart';
import 'package:qoutes/config/locale/app_localizations.dart';
import 'package:qoutes/core/utils/app_colors.dart';

class CustomErrorWidget extends StatelessWidget {
  final void Function() onPressed;
  const CustomErrorWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 15,
      children: [
        Icon(
          Icons.warning_amber_rounded,
          size: 52,
          color: AppColors.primaryColor,
        ),
        Text(
          AppLocalizations.of(context)!.translate("something_went_wrong")!,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(AppLocalizations.of(context)!.translate("try_again")!, style: Theme.of(context).textTheme.bodySmall),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
          ),
          child: Text(AppLocalizations.of(context)!.translate("reload_screen")!, style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
