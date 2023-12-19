import 'package:flutter/material.dart';
import 'package:flutter_app/extensions/build_context_extension.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({
    super.key,
  });

  @override
  build(context, ref) {
    useEffect(() {
      Future.delayed(Duration(seconds: 2), () {
        // TODO intro
        context.router.go('/sign_in');
      });
    }, []);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF9701D3),
                Color(0xFF5E57FF),
              ],
            )),
          )
        ],
      ),
    );
  }
}
