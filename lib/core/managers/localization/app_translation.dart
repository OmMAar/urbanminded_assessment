import 'package:urbanminded_assessment/core/di/di.dart';
import 'package:urbanminded_assessment/core/managers/localization/generated/l10n.dart';

Translations get translate =>Translations.of(
      navigator.navigatorKey.currentContext!,
    );
