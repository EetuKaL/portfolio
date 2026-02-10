import 'dart:convert';
import 'dart:io';

import 'package:jaspr/jaspr.dart';

class S extends InheritedComponent {
  static const Set<String> supportedLocales = {'en', 'fi'};

  final _S strings;

  S({required super.child, String? locale}) : strings = _S(locale ?? 'en');

  @override
  bool updateShouldNotify(covariant S oldComponent) => strings.locale != oldComponent.strings.locale;

  static _S of(BuildContext context) {
    final s = context.dependOnInheritedComponentOfExactType<S>();
    if (s == null) throw Exception('No S found in context');
    return s.strings;
  }
}

class _S {
  final Map<String, dynamic> _values;
  final Map<String, dynamic> _fallback;
  final String locale;

  _S._(this._values, this._fallback, this.locale);

  static final Map<String, _S> _cache = {};

  factory _S(String locale) {
    if (_cache.containsKey(locale)) return _cache[locale]!;

    final file = File('lib/localizations/$locale.arb');
    final fallback;
    final map = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;

    if (locale != 'en') {
      final fallbackFile = File('lib/localizations/en.arb');
      fallback = jsonDecode(fallbackFile.readAsStringSync()) as Map<String, dynamic>;
    } else {
      fallback = map;
    }

    final instance = _S._(map, fallback, locale);
    _cache[locale] = instance;
    return instance;
  }

  String get title => _values['title'] ?? _fallback['title'] as String;
  String get navAbout => _values['nav_about'] ?? _fallback['nav_about'] as String;
  String get navTools => _values['nav_tools'] ?? _fallback['nav_tools'] as String;
  String get navExperience => _values['nav_experience'] ?? _fallback['nav_experience'] as String;
  String get navContact => _values['nav_contact'] ?? _fallback['nav_contact'] as String;
  String get heroSystem => _values['hero_system'] ?? _fallback['hero_system'] as String;
  String get heroName => _values['hero_name'] ?? _fallback['hero_name'] as String;
  String get heroRole1 => _values['hero_role_1'] ?? _fallback['hero_role_1'] as String;
  String get heroRole2 => _values['hero_role_2'] ?? _fallback['hero_role_2'] as String;
  String get heroCta => _values['hero_cta'] ?? _fallback['hero_cta'] as String;
  String get aboutTitle => _values['about_title'] ?? _fallback['about_title'] as String;
  String get aboutP1Prefix => _values['about_p1_prefix'] ?? _fallback['about_p1_prefix'] as String;
  String get aboutP1Highlight => _values['about_p1_highlight'] ?? _fallback['about_p1_highlight'] as String;
  String get aboutP1Suffix => _values['about_p1_suffix'] ?? _fallback['about_p1_suffix'] as String;
  String get aboutP2 => _values['about_p2'] ?? _fallback['about_p2'] as String;
  String get statYears => _values['stat_years'] ?? _fallback['stat_years'] as String;
  String get statMotivation => _values['stat_motivation'] ?? _fallback['stat_motivation'] as String;
  String get attrTitle => _values['attr_title'] ?? _fallback['attr_title'] as String;
  String get attr1Title => _values['attr_1_title'] ?? _fallback['attr_1_title'] as String;
  String get attr1Body => _values['attr_1_body'] ?? _fallback['attr_1_body'] as String;
  String get attr2Title => _values['attr_2_title'] ?? _fallback['attr_2_title'] as String;
  String get attr2Body => _values['attr_2_body'] ?? _fallback['attr_2_body'] as String;
  String get attr3Title => _values['attr_3_title'] ?? _fallback['attr_3_title'] as String;
  String get attr3Body => _values['attr_3_body'] ?? _fallback['attr_3_body'] as String;
  String get skillsTitle => _values['skills_title'] ?? _fallback['skills_title'] as String;
  String get experienceTitle => _values['experience_title'] ?? _fallback['experience_title'] as String;
  String get exp1Task1 => _values['exp1_task_1'] ?? _fallback['exp1_task_1'] as String;
  String get exp1Task2 => _values['exp1_task_2'] ?? _fallback['exp1_task_2'] as String;
  String get exp1Task3 => _values['exp1_task_3'] ?? _fallback['exp1_task_3'] as String;
  String get exp2Task1 => _values['exp2_task_1'] ?? _fallback['exp2_task_1'] as String;
  String get exp2Task2 => _values['exp2_task_2'] ?? _fallback['exp2_task_2'] as String;
  String get exp2Task3 => _values['exp2_task_3'] ?? _fallback['exp2_task_3'] as String;
  String get educationTitle => _values['education_title'] ?? _fallback['education_title'] as String;
  String get edu1Title => _values['edu1_title'] ?? _fallback['edu1_title'] as String;
  String get edu2Title => _values['edu2_title'] ?? _fallback['edu2_title'] as String;
  String get contactTitle => _values['contact_title'] ?? _fallback['contact_title'] as String;
  String get contactEmail => _values['contact_email'] ?? _fallback['contact_email'] as String;
  String get contactPhone => _values['contact_phone'] ?? _fallback['contact_phone'] as String;
  String get contactLocation => _values['contact_location'] ?? _fallback['contact_location'] as String;
  String get footerText => _values['footer_text'] ?? _fallback['footer_text'] as String;
  String get ariaTop => _values['aria_top'] ?? _fallback['aria_top'] as String;
  String get edu1Institution => _values['edu1_institution'] ?? _fallback['edu1_institution'] as String;
  String get edu2Institution => _values['edu2_institution'] ?? _fallback['edu2_institution'] as String;
  String get edu1Period => _values['edu1_period'] ?? _fallback['edu1_period'] as String;
  String get edu2Period => _values['edu2_period'] ?? _fallback['edu2_period'] as String;
}
