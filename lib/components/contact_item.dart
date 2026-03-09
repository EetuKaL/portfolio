import 'package:eetu_portfolio/l10n/generated/s.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:universal_web/web.dart' as web;

class ContactItem extends StatelessComponent {
  final String iconClass;
  final void Function(web.Event)? onIconClick;
  final String label;
  final String value;
  final String? classes;

  ContactItem({
    required this.iconClass,
    this.onIconClick,
    required this.label,
    required this.value,
    this.classes,
  });

  @override
  Component build(BuildContext context) {
    final feedbackText = S.of(context)!.copied;
    return div(
      classes:
          'w-full flex items-center space-x-2 md:space-x-4 relative cursor-pointer ${classes ?? ''}',
      [
        div(
          events: {if (onIconClick != null) 'click': onIconClick!},
          classes:
              'w-12 h-12 rounded-full neon-border flex items-center justify-center text-cyan-400',
          [i(classes: iconClass, [])],
        ),
        div(classes: 'w-full', [
          div(
            classes:
                'w-full flex justify-start items-start gap-[8px] text-xs text-gray-500 uppercase font-tech',
            [
              Component.text(label),
              i(
                events: {
                  'click': (event) {
                    _handleCopy(value, feedbackText, event);
                  },
                },
                classes: 'fas fa-copy',
                [],
              ),
            ],
          ),
          div(classes: 'text-md md:text-lg', [Component.text(value)]),
        ]),
      ],
    );
  }
}

void _handleCopy(String value, String feedbackText, web.Event event) {
  web.window.navigator.clipboard.writeText(value);
  final mouseEvent = event as web.MouseEvent;
  final x = mouseEvent.clientX;
  final y = mouseEvent.clientY;

  final feedback = web.document.createElement('div') as web.HTMLElement;
  feedback.textContent = feedbackText;

  feedback.style
    ..position = 'fixed'
    ..left = '${x}px'
    ..top = '${y}px'
    ..transform = 'translate(0%, -100%)'
    ..color = '#00f2ff'
    ..fontSize = '12px'
    ..fontWeight = 'bold'
    ..pointerEvents = 'none'
    ..opacity = '1'
    ..transition = 'all 0.6s ease-out'
    ..zIndex = '10';
  web.document.body!.appendChild(feedback);

  // Delay so the browser paints the initial state before animating
  Future.delayed(Duration(milliseconds: 20), () {
    feedback.style
      ..opacity = '0'
      ..transform = 'translate(0%, -200%)';
  });

  // Remove element after animation completes
  Future.delayed(Duration(milliseconds: 650), () {
    feedback.remove();
  });
}
