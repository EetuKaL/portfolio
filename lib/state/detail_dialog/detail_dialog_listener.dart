import 'package:eetu_portfolio/state/detail_dialog/detail_dialog.dart';
import 'package:eetu_portfolio/state/detail_dialog/detail_dialog_provider.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class DialogData {
  final String title;
  final String details;

  DialogData(this.title, this.details);
}

class DetailDialogListener extends StatefulComponent {
  final Component child;

  const DetailDialogListener({required this.child, super.key});

  @override
  State<DetailDialogListener> createState() => DetailDialogState();
}

class DetailDialogState extends State<DetailDialogListener> {
  DialogData? _showDetails;

  void openDetailDialog(DialogData data) {
    setState(() {
      _showDetails = data;
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
      open: _showDetails != null,
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
                title: _showDetails!.title,
                details: _showDetails!.details,
                onClose: closeDetailDialog,
              ),
            ],
          ),
      ]),
    );
  }
}
