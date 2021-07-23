import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListItemsBuilder<T> extends StatelessWidget {
  const ListItemsBuilder({
    Key? key,
    required this.data,
    required this.itemBuilder,
  }) : super(key: key);
  final AsyncValue<List<T>> data;
  final ItemWidgetBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    return data.when(
      data: (items) =>
          items.isNotEmpty ? _buildList(items) : const EmptyContent(),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => EmptyContent(
        title: LocaleKeys.somethingWentWrong.tr(),
        message: LocaleKeys.cantLoadDataRightNow.tr(),
      ),
    );
  }

  Widget _buildList(List<T> items) {
    return ListView.separated(
      itemCount: items.length + 2,
      separatorBuilder: (context, index) => const Divider(height: 0.5),
      itemBuilder: (context, index) {
        if (index == 0 || index == items.length + 1) {
          return const SizedBox(); // zero height: not visible
        }
        return itemBuilder(context, items[index - 1]);
      },
    );
  }
}
