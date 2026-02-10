import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:eetu_portfolio/localizations/s.dart';

class Education extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    final s = S.of(context);
    return section(id: 'education', classes: 'reveal space-y-8', [
      h2(classes: 'text-3xl font-bold neon-text', [Component.text(s.educationTitle)]),
      div(classes: 'space-y-6', [
        div(classes: 'glass-card p-6 rounded-xl', [
          div(classes: 'text-cyan-400 text-xs font-tech mb-2', [Component.text(s.edu1Period)]),
          h4(classes: 'font-bold', [Component.text(s.edu1Title)]),
          p(classes: 'text-sm text-gray-400', [Component.text(s.edu1Institution)]),
        ]),
        div(classes: 'glass-card p-6 rounded-xl', [
          div(classes: 'text-cyan-400 text-xs font-tech mb-2', [Component.text(s.edu2Period)]),
          h4(classes: 'font-bold', [Component.text(s.edu2Title)]),
          p(classes: 'text-sm text-gray-400', [Component.text(s.edu2Institution)]),
        ]),
      ]),
    ]);
  }
}
