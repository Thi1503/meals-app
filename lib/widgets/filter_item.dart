import 'package:flutter/material.dart';
class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.valueFilterSet,
    required this.titleText,
    required this.subtitleText,
    required this.onChanged,
  });

  final bool valueFilterSet;
  final String titleText;
  final String subtitleText;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: valueFilterSet,
      onChanged: onChanged,
      title: Text(
        titleText,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Text(
        subtitleText,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 14,
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
