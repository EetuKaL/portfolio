import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class Projects extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(id: 'projects', classes: 'reveal space-y-8', [
      h2(classes: 'text-3xl font-bold neon-text text-left md:text-center', [
        Component.text('Projects'),
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
            h3(
              classes: 'text-xl font-bold font-tech tracking-wider neon-text',
              [Component.text('LOADING...')],
            ),
            p(classes: 'text-gray-500 text-sm max-w-md', [
              Component.text(
                'Project showcase is currently under construction. Check back soon for featured work.',
              ),
            ]),
          ]),
          div(classes: 'flex items-center space-x-2 pt-2', [
            div(classes: 'w-2 h-2 rounded-full bg-cyan-400 animate-pulse', []),
            span(
              classes:
                  'text-[10px] text-gray-600 font-tech tracking-widest uppercase',
              [Component.text('COMPILING PROJECTS')],
            ),
          ]),
        ],
      ),
    ]);
  }
}
