import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:eetu_portfolio/localizations/s.dart';

import 'experience_card.dart';

class Experience extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    final s = S.of(context);
    return section(id: 'experience', classes: 'reveal', [
      h2(
        classes: 'text-3xl font-bold mb-12 neon-text text-center',
        [Component.text(s.experienceTitle)],
      ),
      div(classes: 'space-y-8', [
        ExperienceCard(
          company: 'Aprikoodi Oy',
          role: 'Software Developer',
          period: '04/2024 — 12/2025',
          accentClass: 'cyan',
          tasks: [
            s.exp1Task1,
            s.exp1Task2,
            s.exp1Task3,
          ],
          badges: ['Flutter', 'Golang', 'Firebase', 'Figma'],
        ),
        ExperienceCard(
          company: 'Amabit Oy',
          role: 'Software Developer',
          period: '06/2022 — 11/2022',
          accentClass: 'purple',
          tasks: [
            s.exp2Task1,
            s.exp2Task2,
            s.exp2Task3,
          ],
          badges: ['AWS Lambda', 'React', 'Flutter', 'Serverless'],
        ),
      ]),
    ]);
  }
}
