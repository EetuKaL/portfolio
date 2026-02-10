import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class StatCard extends StatelessComponent {
  final String value;
  final String label;
  final String color;

  StatCard({required this.value, required this.label, this.color = 'cyan'});

  @override
  Component build(BuildContext context) {
    return div(classes: 'p-4 glass-card rounded-lg', [
      div(classes: 'text-${color}-400 text-2xl font-bold mb-1', [Component.text(value)]),
      div(classes: 'text-xs uppercase text-gray-500', [Component.text(label)]),
    ]);
  }
}
