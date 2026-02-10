import 'package:eetu_portfolio/l10n/generated/s.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class Footer extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    final s = S.of(context)!;
    return footer(
        classes: 'py-20 text-center border-t border-white/5 bg-black/40',
        [
          div(
            classes:
                'text-sm text-gray-600 font-tech tracking-widest uppercase',
            [Component.text(s.footer_text)],
          ),
        ]);
  }
}
