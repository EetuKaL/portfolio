import 'package:eetu_portfolio/components/hero.dart';
import 'package:eetu_portfolio/components/projects.dart';
import 'package:eetu_portfolio/effects/client_effects.dart';
import 'package:eetu_portfolio/components/detail_dialog_listener.dart';
import 'package:eetu_portfolio/l10n/generated/s.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_localizations/jaspr_localizations.dart';
import 'package:universal_web/web.dart' as web;
import 'components/about.dart';
import 'components/contact.dart';
import 'components/education.dart';
import 'components/experience.dart';
import 'components/footer.dart';
import 'components/nav.dart';
import 'components/skills.dart';

@client
class App extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return JasprLocalizations(
      initialLocale: kIsWeb ? _getBrowserLocale() : const Locale('en'),
      supportedLocales: S.supportedLocales
          .map((locale) => Locale.fromLanguageTag(locale))
          .toList(),
      builder: (context, locale) {
        return ClientEffects(
          child: DetailDialogListener(
            child: Builder(
              builder: (context) => div(id: 'app', [
                Component.element(tag: 'div', id: 'top'),
                Component.element(tag: 'canvas', id: 'bg-canvas'),
                Nav(),
                div(
                  classes:
                      'max-w-full sm:max-w-2xl md:max-w-4xl lg:max-w-5xl xl:max-w-6xl mx-auto px-2 sm:px-4 md:px-6 py-10 sm:py-16 md:py-20 space-y-16 md:space-y-24 lg:space-y-32',
                  [
                    Hero(),
                    About(),
                    Skills(),
                    Projects(),
                    Experience(),
                    div(
                      classes:
                          'flex flex-col md:flex-row md:justify-between gap-8 md:gap-24 w-full',
                      [Education(), Contact()],
                    ),
                  ],
                ),
                div(
                  classes:
                      'fixed bottom-4 right-4 bg-cyan-500 rounded-full animate-[pulse_4s_ease-in-out_infinite] duration-1000 p-4',
                  [
                    i(
                      classes:
                          'fas fa-phone text-3xl text-cyan-400, cursor-pointer',
                      [],
                      events: {
                        'click': (_) {
                          web.window.open('tel:+358456100886', '_self');
                        },
                      },
                    ),
                  ],
                ),

                Footer(),
              ]),
            ),
          ),
        );
      },
    );
  }
}

Locale _getBrowserLocale() {
  final supported = S.supportedLocales.toSet();
  final browserLang = web.window.navigator.language;
  final lang = browserLang.split('-').first.toLowerCase();
  if (supported.contains(lang)) {
    return Locale(lang);
  }
  return const Locale('en');
}
