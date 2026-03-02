import 'package:eetu_portfolio/l10n/generated/s.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'attribute_item.dart';
import 'stat_card.dart';

class About extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    final s = S.of(context)!;
    return section(
      id: 'about',
      classes: 'reveal grid md:grid-cols-2 gap-12 items-center',
      [
        div(classes: 'space-y-6', [
          h2(classes: 'text-3xl font-bold neon-text', [
            Component.text(s.about_title),
          ]),
          p(classes: 'text-gray-300 leading-relaxed text-lg', [
            Component.text(s.about_p1_prefix),
            span(classes: 'text-cyan-300', [
              Component.text(s.about_p1_highlight),
            ]),
            Component.text(s.about_p1_suffix),
          ]),
          p(classes: 'text-gray-400', [Component.text(s.about_p2)]),
          div(classes: 'grid grid-cols-2 gap-4 pt-4', [
            StatCard(value: '3+', label: s.stat_years),
            StatCard(value: '100%', label: s.stat_motivation, color: 'purple'),
          ]),
          div(
            classes:
                'glass-card p-6 rounded-2xl relative overflow-hidden group',
            [
              div(
                classes:
                    'absolute top-0 right-0 p-2 opacity-10 group-hover:opacity-100 transition-opacity',
                [i(classes: 'fas fa-microchip text-4xl text-cyan-400', [])],
              ),
              h3(classes: 'text-xl font-bold mb-4 flex items-center', [
                span(classes: 'w-8 h-px bg-cyan-500 mr-3', []),
                Component.text(s.attr_title),
              ]),
              ul(classes: 'space-y-4 text-gray-400', [
                AttributeItem(
                  title: s.attr_1_title,
                  textContent: s.attr_1_body,
                ),
                AttributeItem(
                  title: s.attr_2_title,
                  textContent: s.attr_2_body,
                ),
                AttributeItem(
                  title: s.attr_3_title,
                  textContent: s.attr_3_body,
                ),
              ]),
            ],
          ),
        ]),
        div(classes: 'grid grid-cols-1 gap-6 h-full', [
          // Profile image
          div(classes: 'relative group flex justify-center h-full', [
            div(
              classes:
                  'absolute -inset-1 rounded-2xl bg-gradient-to-br from-cyan-400 via-purple-500 to-cyan-400 opacity-50 blur-md group-hover:opacity-80 transition-opacity duration-500',
              [],
            ),
            div(
              classes:
                  'relative w-full h-full rounded-2xl overflow-hidden border-2 border-white/10 group-hover:border-cyan-400/50 transition-all duration-500',
              [
                img(
                  src: 'me.jpg',
                  alt: 'Eetu Kallioniemi',
                  classes:
                      'w-full h-full object-cover grayscale group-hover:grayscale-0 transition-all duration-700',
                ),
              ],
            ),
          ]),
        ]),
      ],
    );
  }
}
