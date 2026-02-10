import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../localizations/loc.dart' as loc;

class Hero extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(classes: 'h-screen flex flex-col justify-center items-center relative px-4 overflow-hidden', [
      div(classes: 'absolute inset-0 bg-gradient-to-b from-transparent via-cyan-900/5 to-transparent', []),
      div(classes: 'text-center z-10', [
        h2(
          classes: 'text-cyan-400 font-tech tracking-[0.3em] mb-4 opacity-70 animate-pulse',
          [Component.text(loc.tr(context, 'hero_system'))],
        ),
        h1(
          classes: 'text-5xl md:text-8xl font-black glitch mb-6 tracking-tighter',
          attributes: {'data-text': 'EETU KALLIONIEMI'},
          [Component.text(loc.tr(context, 'hero_name'))],
        ),
        p(classes: 'text-xl md:text-2xl font-light tracking-widest text-gray-400 mb-10 max-w-2xl mx-auto uppercase', [
          Component.text(loc.tr(context, 'hero_role_1')),
          span(classes: 'text-cyan-400 mx-2', [Component.text('//')]),
          Component.text(loc.tr(context, 'hero_role_2')),
        ]),
        div(classes: 'flex flex-wrap justify-center gap-4', [
          a(
            href: '#about',
            classes:
                'px-8 py-3 bg-cyan-500/10 border border-cyan-500/50 hover:bg-cyan-500/20 text-cyan-400 transition-all font-tech tracking-wider uppercase text-sm',
            [Component.text(loc.tr(context, 'hero_cta'))],
          ),
        ]),
      ]),
      div(classes: 'absolute bottom-10 animate-bounce', [
        i(classes: 'fas fa-chevron-down text-cyan-500/50', []),
      ]),
    ]);
  }
}
