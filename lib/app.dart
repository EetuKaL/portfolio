import 'package:eetu_portfolio/components/hero.dart';
import 'package:eetu_portfolio/l10n/generated/s.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart' hide Document;
import 'package:jaspr_localizations/jaspr_localizations.dart';

import 'components/about.dart';
import 'components/contact.dart';
import 'components/education.dart';
import 'components/experience.dart';
import 'components/footer.dart';
import 'components/nav.dart';
import 'components/skills.dart';

Locale _localeFromHeader(String reqHeader) {
  final supported = S.supportedLocales
      .map((locale) => Locale.fromLanguageTag(locale))
      .toList();
  final requested = reqHeader.split(',').map((s) => s.trim()).toList();

  for (var req in requested) {
    for (var sup in supported) {
      if (req.startsWith(sup.languageCode)) {
        return sup;
      }
    }
  }
  return Locale('en');
}

class App extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return JasprLocalizations(
        initialLocale:
            _localeFromHeader(context.headers['Accept-Language'] ?? ''),
        supportedLocales: S.supportedLocales
            .map((locale) => Locale.fromLanguageTag(locale))
            .toList(),
        builder: (context, locale) {
          final s = S.of(context);
          return Component.fragment([
            Document.html(attributes: {'lang': locale.languageCode}),
            Document.head(
              title: s?.title,
              meta: {'viewport': 'width=device-width, initial-scale=1.0'},
              children: [
                Component.element(
                    tag: 'meta', attributes: {'charset': 'utf-8'}),
                script(src: 'https://cdn.tailwindcss.com'),
                link(
                    rel: 'stylesheet',
                    href:
                        'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css'),
                link(rel: 'stylesheet', href: 'styles.css'),
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
              script(src: 'app.js'),
            ]),
          ]);
        });
  }
}
