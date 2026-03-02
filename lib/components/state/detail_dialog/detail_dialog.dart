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
    return div(classes: 'relative w-[90vw] max-w-lg mx-4 dialog-enter', [
      // Outer glow border
      div(
        classes:
            'absolute -inset-[1px] rounded-2xl bg-gradient-to-br from-cyan-400 via-purple-500 to-cyan-400 blur-sm dialog-glow',
        [],
      ),
      // Card body
      div(
        classes:
            'relative rounded-2xl border border-white/10 overflow-hidden bg-[#0a0a0f]',
        [
          // Header bar
          div(
            classes:
                'flex items-center justify-between px-6 py-4 border-b border-white/10 bg-cyan-500/5',
            [
              h3(
                classes: 'text-lg font-bold font-tech tracking-wider neon-text',
                [Component.text(title)],
              ),
              button(
                classes:
                    'w-8 h-8 rounded-lg flex items-center justify-center bg-white/5 border border-white/10 hover:bg-white/10 transition-colors duration-200 cursor-pointer group',
                onClick: onClose,
                [
                  i(
                    classes:
                        'fas fa-xmark text-gray-400 group-hover:text-cyan-400 transition-colors',
                    [],
                  ),
                ],
              ),
            ],
          ),
          // Content
          div(classes: 'px-6 py-5', [
            div(classes: 'flex items-center space-x-3', [
              i(classes: 'fas fa-chevron-right text-cyan-400/60 text-xs', []),
              p(classes: 'text-gray-300 leading-relaxed text-sm', [
                Component.text(details),
              ]),
            ]),
          ]),
          // Footer decoration
          div(
            classes:
                'px-6 py-3 border-t border-white/5 flex items-center justify-between bg-cyan-500/[0.02]',
            [
              div(classes: 'flex items-center space-x-2', [
                div(
                  classes: 'w-2 h-2 rounded-full bg-cyan-400 animate-pulse',
                  [],
                ),
                span(
                  classes:
                      'text-[10px] text-gray-500 font-tech tracking-widest uppercase',
                  [Component.text('SYSTEM.ACTIVE')],
                ),
              ]),
              div(classes: 'flex space-x-1', [
                div(classes: 'w-1.5 h-1.5 rounded-full bg-cyan-400/40', []),
                div(classes: 'w-1.5 h-1.5 rounded-full bg-purple-500/40', []),
                div(classes: 'w-1.5 h-1.5 rounded-full bg-cyan-400/40', []),
              ]),
            ],
          ),
        ],
      ),
    ]);
  }
}
