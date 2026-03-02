import 'package:jaspr/jaspr.dart';

class DetailDialogProvider extends InheritedComponent {
  final bool showDialog;
  final Function(String) openDialog;
  final Function() closeDialog;
  const DetailDialogProvider({
    required this.showDialog,
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
    return oldWidget.showDialog != showDialog;
  }
}
