import 'package:eetu_portfolio/l10n/generated/s.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class Projects extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    final s = S.of(context)!;
    return section(id: 'projects', classes: 'reveal space-y-4 md:space-y-8', [
      h2(classes: 'text-3xl font-bold neon-text text-left md:text-center', [
        Component.text(s.projects),
      ]),
      div(
        classes:
            'glass-card p-12 rounded-2xl flex flex-col items-center justify-center text-center space-y-6',
        [
          div(classes: 'relative', [
            i(classes: 'fas fa-folder-open text-5xl text-cyan-400/20', []),
            div(
              classes:
                  'absolute -top-1 -right-1 w-3 h-3 rounded-full bg-purple-500 animate-pulse',
              [],
            ),
          ]),
          div(classes: 'space-y-2', [
            h3(classes: 'text-gray-500 font-tech text-m uppercase', [
              Component.text(s.underwork),
            ]),
            p(classes: 'text-gray-500 text-sm', [
              Component.text(s.projects_underwork_desc),
            ]),
          ]),
        ],
      ),
    ]);
  }
}
