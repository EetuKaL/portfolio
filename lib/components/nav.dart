import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../localizations/loc.dart' as loc;

class Nav extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return nav(
      classes: 'fixed top-0 w-full z-50 py-6 px-8 flex justify-between items-center backdrop-blur-md bg-black/20',
      [
        a(
          href: '#top',
          classes:
              'text-xl font-bold font-tech tracking-tighter neon-text px-3 py-2 rounded-md border border-cyan-500/40 hover:bg-cyan-500/10 transition-colors',
          attributes: {'role': 'button', 'aria-label': loc.tr(context, 'aria_top')},
          [Component.text('EETU.EXE')],
        ),
        div(classes: 'hidden md:flex space-x-8 text-sm uppercase tracking-widest font-tech', [
          a(href: '#about', classes: 'nav-link', [Component.text(loc.tr(context, 'nav_about'))]),
          a(href: '#skills', classes: 'nav-link', [Component.text(loc.tr(context, 'nav_tools'))]),
          a(href: '#experience', classes: 'nav-link', [Component.text(loc.tr(context, 'nav_experience'))]),
          a(href: '#contact', classes: 'nav-link', [Component.text(loc.tr(context, 'nav_contact'))]),
        ]),
        div(classes: 'flex space-x-4', [
          a(
            href: 'https://github.com/Eetukal./td',
            target: Target.blank,
            classes: 'hover:text-cyan-400 transition-colors',
            [i(classes: 'fab fa-github text-xl', [])],
          ),
          a(
            href: 'https://www.linkedin.com/in/eetu-kkallioniemi-87248b2lb',
            target: Target.blank,
            classes: 'hover:text-cyan-400 transition-colors',
            [i(classes: 'fab fa-linkedin text-xl', [])],
          ),
        ]),
      ],
    );
  }
}
