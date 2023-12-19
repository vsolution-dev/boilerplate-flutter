import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_app_bar.dart';
import 'package:flutter_app/components/custom_buttons.dart';
import 'package:flutter_app/components/custom_card.dart';
import 'package:flutter_app/components/custom_checkbox.dart';
import 'package:flutter_app/components/custom_scaffold.dart';
import 'package:flutter_app/components/custom_text_field.dart';
import 'package:flutter_app/styles/custom_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DebugPage extends HookConsumerWidget {
  const DebugPage({
    super.key,
  });

  @override
  build(context, ref) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: Text('Debug'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCheckbox('CustomCheckboxCustomCheckboxCustomCheckboxCustomCheckboxCustomCheckboxCustomCheckbox'),
            CustomCard(child: Text('CustomCardCustomCardCustomCardCustomCardCustomCardCustomCard')),
            CustomButtons.outlined('CustomButtons.outlinedCustomButtons.outlinedCustomButtons.outlinedCustomButtons.outlinedCustomButtons.outlined'),
            CustomButtons.outlined('취소', isDisabled: true),
            CustomButtons.filled('확인', isDisabled: true),
            CustomButtons.filled('확인'),
            CustomButtons.filled('성공', variant: ButtonVariant.success),
            CustomButtons.filled('실패', variant: ButtonVariant.error),
            CustomTextField(
              errorText: 'errorText',
              hintText: 'hintText',
              suffixIcon: CustomButtons.icon(CustomIcons.eye),
            ),
            CustomTextField(
              hintText: 'hintText',
            ),
            CustomButtons.text(
              'CustomButtons.textCustomButtons.textCustomButtons.textCustomButtons.textCustomButtons.text',
              onPressed: () {},
              suffixIcon: CustomIcons.fly,
            ),
          ],
        ),
      ),
    );
  }
}
