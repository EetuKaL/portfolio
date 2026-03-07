import 'package:eetu_portfolio/components/contact_item.dart';
import 'package:eetu_portfolio/l10n/generated/s.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:universal_web/web.dart' as web;

class Contact extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    final s = S.of(context)!;
    return section(id: 'contact', classes: 'reveal space-y-4 md:space-y-8', [
      h2(classes: 'text-3xl font-bold neon-text text-left md:text-right', [
        Component.text(s.contact_title),
      ]),
      div(classes: 'glass-card p-8 rounded-2xl space-y-6', [
        ContactItem(
          iconClass: 'fas fa-envelope',
          onIconClick: (event) {
            web.window.open('mailto:eetukallioniemi96@gmail.com', '_blank');
          },
          label: s.contact_email,
          value: 'eetukallioniemi96@gmail.com',
        ),
        ContactItem(
          onIconClick: (event) {
            web.window.open('tel:+358456100886', '_self');
          },
          iconClass: 'fas fa-phone',
          label: s.contact_phone,
          value: '+358 45 6100886',
        ),
        ContactItem(
          onIconClick: (event) {
            web.window.open(
              'https://www.google.com/maps/search/?api=1&query=Naulatie+18,+Orivesi',
              '_blank',
            );
          },
          iconClass: 'fas fa-map-marker-alt',
          label: s.contact_location,
          value: 'Naulatie 18, Orivesi',
        ),
      ]),
    ]);
  }
}
