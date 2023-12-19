import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomCheckbox extends HookConsumerWidget {
  final String label;
  final bool value;
  final Function(bool)? onChanged;

  const CustomCheckbox(
    this.label, {
    super.key,
    this.value = false,
    this.onChanged,
  });

  @override
  build(context, ref) {
    final state = useState<bool>(value);

    toggle() {
      final value = !state.value;

      onChanged?.call(value);
      state.value = value;
    }

    return GestureDetector(
      onTap: () => toggle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: state.value,
                  semanticLabel: label,
                  onChanged: (value) => toggle(),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
