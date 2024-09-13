import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.only(top: mediaQuery.viewPadding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_left_rounded),
          ),
          GestureDetector(
            onTap: () {
              onTitleTap(DateTime.now());
            },
            child: title,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_right_rounded),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
