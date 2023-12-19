import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_scaffold.dart';
import 'package:flutter_app/pages/sign_in/components/sign_in_form.dart';
import 'package:flutter_app/pages/sign_in/components/sign_up_form.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IntroPage extends HookConsumerWidget {
  const IntroPage({
    super.key,
  });

  @override
  build(context, ref) {
    final _controller = useTabController(initialLength: 2);

    return CustomScaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          scrollDirection: Axis.vertical,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _controller.index = 0;
                    },
                    child: Text('로그인'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.index = 1;
                    },
                    child: Text('회원가입'),
                  )
                ],
              ),
            ),
          ],
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: [
              SignInForm(),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
