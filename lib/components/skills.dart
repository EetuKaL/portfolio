import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../localizations/loc.dart' as loc;

class Skills extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    const skills = [
      ('Flutter', 'fab fa-flutter'),
      ('React', 'fab fa-react'),
      ('AWS', 'fab fa-aws'),
      ('Firebase', 'fas fa-fire'),
      ('Figma', 'fab fa-figma'),
      ('Golang', 'fas fa-code'),
      ('Serverless', 'fas fa-server'),
      ('CI/CD', 'fas fa-infinity'),
    ];

    return section(id: 'skills', classes: 'reveal', [
      h2(classes: 'text-3xl font-bold text-center mb-16 neon-text', [Component.text(loc.tr(context, 'skills_title'))]),
      div(classes: 'grid grid-cols-2 md:grid-cols-4 gap-6', [
        for (var skill in skills)
          div(classes: 'glass-card p-8 rounded-2xl text-center group hover:neon-border', [
            i(classes: '${skill.$2} text-4xl mb-4 group-hover:scale-110 transition-transform', []),
            h4(classes: 'font-bold', [Component.text(skill.$1)]),
          ]),
      ]),
    ]);
  }
}
