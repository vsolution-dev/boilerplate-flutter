import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SimpleWebView extends HookConsumerWidget {
  final String url;

  const SimpleWebView({
    super.key,
    required this.url,
  });

  @override
  build(context, ref) {
    late final WebViewController controller;

    useEffect(() {
      controller = WebViewController()
        ..loadRequest(
          Uri.parse(url),
        );
      return () {
        // ...
      };
    }, [url]);

    return WebViewWidget(
      controller: controller,
    );
  }
}
