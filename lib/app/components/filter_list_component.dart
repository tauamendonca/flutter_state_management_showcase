import 'package:flutter/material.dart';

import '../core/widgets/filter_item_widget.dart';

class FilterListComponent extends StatelessWidget {
  const FilterListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilterItemWidget(
            isSelected: true,
            title: 'Todas',
            notificationCount: 32,
            onTap: () {},
          ),
          const SizedBox(width: 6),
          const VerticalDivider(),
          FilterItemWidget(
            isSelected: false,
            title: 'Abertas',
            notificationCount: 12,
            onTap: () {},
          ),
          const SizedBox(width: 12),
          FilterItemWidget(
            isSelected: false,
            title: 'Fechadas',
            notificationCount: 0,
            onTap: () {},
          ),
          const SizedBox(width: 12),
          FilterItemWidget(
            isSelected: false,
            title: 'Arquivadas',
            notificationCount: 0,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
