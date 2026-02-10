import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class ExperienceCard extends StatelessComponent {
  final String company;
  final String role;
  final String period;
  final List<String> tasks;
  final List<String> badges;
  final String accentClass;

  ExperienceCard({
    required this.company,
    required this.role,
    required this.period,
    required this.tasks,
    required this.badges,
    required this.accentClass,
  });

  @override
  Component build(BuildContext context) {
    return div(classes: 'glass-card p-8 rounded-2xl border-l-4 border-l-$accentClass-500', [
      div(classes: 'flex flex-wrap justify-between items-start mb-6', [
        div([
          h3(classes: 'text-2xl font-bold', [Component.text(company)]),
          p(classes: 'text-$accentClass-400 font-tech text-sm uppercase', [Component.text(role)]),
        ]),
        div(classes: 'text-gray-500 font-tech text-sm mt-2 md:mt-0', [Component.text(period)]),
      ]),
      ul(classes: 'space-y-3 text-gray-300 mb-6', [
        for (var task in tasks)
          li(classes: 'flex items-start', [
            span(classes: 'text-$accentClass-500 mr-2', [Component.text('/')]),
            Component.text(task),
          ]),
      ]),
      div(classes: 'flex flex-wrap gap-2', [
        for (var badge in badges) span(classes: 'badge', [Component.text(badge)]),
      ]),
    ]);
  }
}
