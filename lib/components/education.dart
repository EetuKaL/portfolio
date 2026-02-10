import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../localizations/loc.dart' as loc;

class Education extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(id: 'education', classes: 'reveal space-y-8', [
      h2(classes: 'text-3xl font-bold neon-text', [Component.text(loc.tr(context, 'education_title'))]),
      div(classes: 'space-y-6', [
        div(classes: 'glass-card p-6 rounded-xl', [
          div(classes: 'text-cyan-400 text-xs font-tech mb-2', [Component.text('2023 — 2024')]),
          h4(classes: 'font-bold', [Component.text(loc.tr(context, 'edu1_title'))]),
          p(classes: 'text-sm text-gray-400', [Component.text('Ideal Learning Oy')]),
        ]),
        div(classes: 'glass-card p-6 rounded-xl', [
          div(classes: 'text-cyan-400 text-xs font-tech mb-2', [Component.text('2021 — 2022')]),
          h4(classes: 'font-bold', [Component.text(loc.tr(context, 'edu2_title'))]),
          p(classes: 'text-sm text-gray-400', [Component.text('Tampere Vocational College (Tredu)')]),
        ]),
      ]),
    ]);
  }
}
