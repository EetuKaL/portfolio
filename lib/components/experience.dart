import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../localizations/loc.dart' as loc;
import 'experience_card.dart';

class Experience extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(id: 'experience', classes: 'reveal', [
      h2(
        classes: 'text-3xl font-bold mb-12 neon-text text-center',
        [Component.text(loc.tr(context, 'experience_title'))],
      ),
      div(classes: 'space-y-8', [
        ExperienceCard(
          company: 'Aprikoodi Oy',
          role: 'Software Developer',
          period: '04/2024 — 12/2025',
          accentClass: 'cyan',
          tasks: [
            loc.tr(context, 'exp1_task_1'),
            loc.tr(context, 'exp1_task_2'),
            loc.tr(context, 'exp1_task_3'),
          ],
          badges: ['Flutter', 'Golang', 'Firebase', 'Figma'],
        ),
        ExperienceCard(
          company: 'Amabit Oy',
          role: 'Software Developer',
          period: '06/2022 — 11/2022',
          accentClass: 'purple',
          tasks: [
            loc.tr(context, 'exp2_task_1'),
            loc.tr(context, 'exp2_task_2'),
            loc.tr(context, 'exp2_task_3'),
          ],
          badges: ['AWS Lambda', 'React', 'Flutter', 'Serverless'],
        ),
      ]),
    ]);
  }
}
