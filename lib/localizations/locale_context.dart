import 'package:jaspr/jaspr.dart';

import 'locale_context_stub.dart' if (dart.library.io) 'locale_context_server.dart';

String? acceptLanguageFromContext(BuildContext context) => getAcceptLanguage(context);
