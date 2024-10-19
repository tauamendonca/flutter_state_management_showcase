import 'package:flutter/material.dart';
import 'package:project_todolist/app/core/utils/app_pickers.dart';

typedef TapDateCallback = void Function(DateTime);

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({
    super.key,
    required this.title,
    required this.onTitleTap,
    required this.onNextTap,
    required this.onPreviousTap,
  });

  final Widget title;
  final TapDateCallback onTitleTap;
  final VoidCallback onNextTap;
  final VoidCallback onPreviousTap; // voidcallback = void funtion()

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Future<void> openDatePicker(BuildContext context) async {
    final date = await AppPickers.appDatePicker(context);

    if (date == null) return;

    onTitleTap(date);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.only(top: mediaQuery.viewPadding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onPreviousTap,
            icon: const Icon(Icons.keyboard_arrow_left_rounded),
          ),
          GestureDetector(
            onTap: () => openDatePicker(context),
            child: title,
          ),
          IconButton(
            onPressed: onNextTap,
            icon: const Icon(Icons.keyboard_arrow_right_rounded),
          ),
        ],
      ),
    );
  }
}
