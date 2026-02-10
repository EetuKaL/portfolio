import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../localizations/loc.dart' as loc;

class Footer extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return footer(classes: 'py-20 text-center border-t border-white/5 bg-black/40', [
      div(
        classes: 'text-sm text-gray-600 font-tech tracking-widest uppercase',
        [Component.text(loc.tr(context, 'footer_text'))],
      ),
    ]);
  }
}
