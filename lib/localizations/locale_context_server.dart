import 'package:jaspr/server.dart';

String? getAcceptLanguage(BuildContext context) => context.headers['accept-language'];
