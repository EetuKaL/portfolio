import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class DetailDialog extends StatelessComponent {
  final String title;
  final String details;
  final Function() onClose;
  const DetailDialog({
    required this.title,
    required this.details,
    required this.onClose,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return div(classes: 'relative w-[90vw] max-w-2xl mx-4 dialog-enter', [
      // Outer glow border
      div(
        classes:
            'absolute -inset-[1px] rounded-2xl bg-gradient-to-br from-cyan-400 via-purple-500 to-cyan-400 blur-sm dialog-glow',
        [],
      ),
      // Card body
      div(
        classes:
            ' max-h-[90vh] overflow-scroll no-scrollbar relative rounded-2xl border border-white/10 overflow-hidden bg-[#0a0a0f]',
        [
          // Header bar
          div(
            classes:
                'sticky top-0 flex items-center justify-between px-6 py-4 border-b border-white/10 bg-cyan-900',
            [
              h2(
                classes: 'text-lg font-bold font-tech tracking-wider neon-text',
                [Component.text(title)],
              ),
              button(
                classes:
                    'w-8 h-8 rounded-lg flex items-center justify-center bg-white/5 border border-white/10 cursor-pointer hover:bg-white/10 transition-colors',
                onClick: () {
                  onClose();
                },
                [i(classes: 'fas fa-xmark text-gray-400', [])],
              ),
            ],
          ),
          // Content
          div(classes: 'px-8 py-6', [
            div(classes: 'flex items-start space-x-3', [
              i(
                classes: 'fas fa-chevron-right text-cyan-400/60 text-xs mt-1.5',
                [],
              ),
              p(classes: 'text-gray-300 leading-relaxed text-base', [
                Component.text(details),
              ]),
            ]),
          ]),
        ],
      ),
    ]);
  }
}
