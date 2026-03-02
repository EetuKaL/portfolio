import 'package:eetu_portfolio/components/hero.dart';
import 'package:eetu_portfolio/components/state/detail_dialog/detail_dialog_listener.dart';
import 'package:eetu_portfolio/components/state/detail_dialog/detail_dialog_provider.dart';
import 'package:eetu_portfolio/l10n/generated/s.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_localizations/jaspr_localizations.dart';
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
      initialLocale: Locale('en'),
      supportedLocales: S.supportedLocales
          .map((locale) => Locale.fromLanguageTag(locale))
          .toList(),
      builder: (context, locale) {
        return DetailDialogListener(
          child: Builder(
            builder: (context) => div([
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
                  Experience(),
                  div(classes: 'grid md:grid-cols-2 gap-12', [
                    Education(),
                    Contact(),
                  ]),
                ],
              ),
              button(
                styles: Styles(
                  position: Position.fixed(
                    left: Unit.percent(50),
                    top: Unit.percent(50),
                  ),
                  backgroundColor: Colors.blue,
                  color: Colors.white,
                ),
                onClick: () {
                  final dDP = DetailDialogProvider.of(context);
                  if (dDP.showDialog) {
                    dDP.closeDialog();
                    return;
                  }
                  dDP.openDialog('Some details');
                },
                [Component.text('Open Dialog')],
              ),

              Footer(),
            ]),
          ),
        );
      },
    );
  }
}
