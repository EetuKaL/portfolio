import 'package:eetu_portfolio/state/detail_dialog/detail_dialog_listener.dart';
import 'package:jaspr/jaspr.dart';

class DetailDialogProvider extends InheritedComponent {
  final bool open;
  final Function(DialogData) openDialog;
  final Function() closeDialog;
  const DetailDialogProvider({
    required this.open,
    required this.openDialog,
    required this.closeDialog,
    required Component child,
    super.key,
  }) : super(child: child);

  static DetailDialogProvider of(BuildContext context) {
    return context
        .dependOnInheritedComponentOfExactType<DetailDialogProvider>()!;
  }

  @override
  bool updateShouldNotify(DetailDialogProvider oldWidget) {
    return oldWidget.open != open;
  }
}
