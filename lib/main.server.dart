import 'package:eetu_portfolio/app.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';
import 'package:jaspr_localizations/jaspr_localizations.dart';

import 'main.server.options.dart';

void main() {
  final locale = getCurrentLocale();
  Jaspr.initializeApp(options: defaultServerOptions);
  runApp(
    Document(
      base: null,
      title: 'Eetu Kallioniemi',
      styles: [css.import('styles.css')],
      meta: {'viewport': 'width=device-width, initial-scale=1.0'},
      head: [
        script(src: 'https://cdn.tailwindcss.com'),
        link(
          rel: 'stylesheet',
          href:
              'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css',
        ),
        script(src: 'main.client.dart.js', defer: true),
      ],
      body: App(),
      lang: locale.languageCode,
    ),
  );
}
