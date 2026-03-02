import 'package:eetu_portfolio/components/state/detail_dialog/detail_dialog.dart';
import 'package:eetu_portfolio/components/state/detail_dialog/detail_dialog_provider.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class DetailDialogListener extends StatefulComponent {
  final Component child;

  const DetailDialogListener({required this.child, super.key});

  @override
  State<DetailDialogListener> createState() => DetailDialogState();
}

class DetailDialogState extends State<DetailDialogListener> {
  String? _showDetails;

  void openDetailDialog(String details) {
    setState(() {
      _showDetails = details;
    });
  }

  void closeDetailDialog() {
    setState(() {
      _showDetails = null;
    });
  }

  @override
  Component build(BuildContext context) {
    return DetailDialogProvider(
      showDialog: _showDetails != null,
      openDialog: openDetailDialog,
      closeDialog: closeDetailDialog,
      child: div([
        component.child,
        if (_showDetails != null)
          div(
            events: {
              'click': (event) {
                if (event.target == event.currentTarget) {
                  closeDetailDialog();
                }
              },
            },
            classes: 'dialog-backdrop',
            styles: Styles(
              position: Position.fixed(top: Unit.zero, left: Unit.zero),
              zIndex: ZIndex(100),
              width: 100.percent,
              height: 100.percent,
              backgroundColor: Colors.black.withOpacity(0.6),
              display: Display.flex,
              justifyContent: JustifyContent.center,
              alignItems: AlignItems.center,
            ),
            [
              DetailDialog(
                title: 'Details',
                details: _showDetails!,
                onClose: closeDetailDialog,
              ),
            ],
          ),
      ]),
    );
  }
}
