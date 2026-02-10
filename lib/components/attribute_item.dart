import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class AttributeItem extends StatelessComponent {
  final String? title;
  final String textContent;
  AttributeItem({this.title, required this.textContent});

  @override
  Component build(BuildContext context) {
    return li(classes: 'flex items-start', [
      i(classes: 'fas fa-check-circle mt-1 mr-3 text-cyan-500', []),
      span([
        if (title != null) strong([Component.text(title!)]),
        Component.text(textContent),
      ]),
    ]);
  }
}
