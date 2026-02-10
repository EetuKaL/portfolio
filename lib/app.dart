import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import 'localizations/loc.dart' as loc;
import 'components/about.dart';
import 'components/contact.dart';
import 'components/education.dart';
import 'components/experience.dart';
import 'components/footer.dart';
import 'components/hero.dart';
import 'components/nav.dart';
import 'components/skills.dart';

class App extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    final lang = loc.resolveLang(context);
    final t = loc.strings[lang]!;

    return Component.fragment([
      Document.html(attributes: {'lang': loc.langCode(lang)}),
      Document.head(
        title: t['title']!,
        meta: {'viewport': 'width=device-width, initial-scale=1.0'},
        children: [
          Component.element(tag: 'meta', attributes: {'charset': 'utf-8'}),
          script(src: 'https://cdn.tailwindcss.com'),
          link(rel: 'stylesheet', href: 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css'),
          link(rel: 'stylesheet', href: '/styles.css'),
        ],
      ),
      div([
        Component.element(tag: 'div', id: 'top'),
        Component.element(tag: 'canvas', id: 'bg-canvas'),
        Nav(),
        div(classes: 'max-w-6xl mx-auto px-6 py-20 space-y-32', [
          Hero(),
          About(),
          Skills(),
          Experience(),
          div(classes: 'grid md:grid-cols-2 gap-12', [
            Education(),
            Contact(),
          ]),
        ]),
        Footer(),
        script(src: '/app.js'),
      ]),
    ]);
  }
}
