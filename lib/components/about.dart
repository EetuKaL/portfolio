import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

import '../localizations/loc.dart' as loc;
import 'attribute_item.dart';
import 'stat_card.dart';

class About extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'reveal grid md:grid-cols-2 gap-12 items-center', [
      div(classes: 'space-y-6', [
        h2(classes: 'text-3xl font-bold neon-text', [Component.text(loc.tr(context, 'about_title'))]),
        p(classes: 'text-gray-300 leading-relaxed text-lg', [
          Component.text(loc.tr(context, 'about_p1_prefix')),
          span(classes: 'text-cyan-300', [Component.text(loc.tr(context, 'about_p1_highlight'))]),
          Component.text(loc.tr(context, 'about_p1_suffix')),
        ]),
        p(classes: 'text-gray-400', [
          Component.text(loc.tr(context, 'about_p2')),
        ]),
        div(classes: 'grid grid-cols-2 gap-4 pt-4', [
          StatCard(value: '3+', label: loc.tr(context, 'stat_years')),
          StatCard(value: '100%', label: loc.tr(context, 'stat_motivation'), color: 'purple'),
        ]),
      ]),
      div(classes: 'grid grid-cols-1 gap-6', [
        div(classes: 'glass-card p-6 rounded-2xl relative overflow-hidden group', [
          div(classes: 'absolute top-0 right-0 p-2 opacity-10 group-hover:opacity-100 transition-opacity', [
            i(classes: 'fas fa-microchip text-4xl text-cyan-400', []),
          ]),
          h3(classes: 'text-xl font-bold mb-4 flex items-center', [
            span(classes: 'w-8 h-px bg-cyan-500 mr-3', []),
            Component.text(loc.tr(context, 'attr_title')),
          ]),
          ul(classes: 'space-y-4 text-gray-400', [
            AttributeItem(title: loc.tr(context, 'attr_1_title'), textContent: loc.tr(context, 'attr_1_body')),
            AttributeItem(title: loc.tr(context, 'attr_2_title'), textContent: loc.tr(context, 'attr_2_body')),
            AttributeItem(title: loc.tr(context, 'attr_3_title'), textContent: loc.tr(context, 'attr_3_body')),
          ]),
        ]),
      ]),
    ]);
  }
}
