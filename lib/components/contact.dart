import 'package:eetu_portfolio/l10n/generated/s.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class Contact extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    final s = S.of(context)!;
    return section(id: 'contact', classes: 'reveal space-y-8', [
      h2(
          classes: 'text-3xl font-bold neon-text text-left md:text-right',
          [Component.text(s.contact_title)]),
      div(classes: 'glass-card p-8 rounded-2xl space-y-6', [
        _contactItem(
          iconClass: 'fas fa-envelope',
          label: s.contact_email,
          value: 'eetukallioniemi96@gmail.com',
        ),
        _contactItem(
          iconClass: 'fas fa-phone',
          label: s.contact_phone,
          value: '+358 45 6100886',
        ),
        _contactItem(
          iconClass: 'fas fa-map-marker-alt',
          label: s.contact_location,
          value: 'Naulatie 18, Orivesi',
        ),
      ]),
    ]);
  }

  Component _contactItem(
      {required String iconClass,
      required String label,
      required String value}) {
    return div(classes: 'flex items-center space-x-4', [
      div(
          classes:
              'w-12 h-12 rounded-full neon-border flex items-center justify-center text-cyan-400',
          [
            i(classes: iconClass, []),
          ]),
      div([
        div(
            classes: 'text-xs text-gray-500 uppercase font-tech',
            [Component.text(label)]),
        div(classes: 'text-lg', [Component.text(value)]),
      ]),
    ]);
  }
}
