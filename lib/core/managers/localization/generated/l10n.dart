// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Translations {
  Translations();

  static Translations? _current;

  static Translations get current {
    assert(_current != null,
        'No instance of Translations was loaded. Try to initialize the Translations delegate before accessing Translations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Translations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Translations();
      Translations._current = instance;

      return instance;
    });
  }

  static Translations of(BuildContext context) {
    final instance = Translations.maybeOf(context);
    assert(instance != null,
        'No instance of Translations present in the widget tree. Did you add Translations.delegate in localizationsDelegates?');
    return instance!;
  }

  static Translations? maybeOf(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `languages`
  String get languages {
    return Intl.message(
      'languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Tap again to exit!`
  String get tapAgainToExit {
    return Intl.message(
      'Tap again to exit!',
      name: 'tapAgainToExit',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasks {
    return Intl.message(
      'Tasks',
      name: 'tasks',
      desc: '',
      args: [],
    );
  }

  /// `Crops`
  String get crops {
    return Intl.message(
      'Crops',
      name: 'crops',
      desc: '',
      args: [],
    );
  }

  /// `Crop Balance`
  String get cropBalance {
    return Intl.message(
      'Crop Balance',
      name: 'cropBalance',
      desc: '',
      args: [],
    );
  }

  /// `Basket Balance`
  String get basketBalance {
    return Intl.message(
      'Basket Balance',
      name: 'basketBalance',
      desc: '',
      args: [],
    );
  }

  /// `Squeeze into VIMP`
  String get squeezeIntoVIMP {
    return Intl.message(
      'Squeeze into VIMP',
      name: 'squeezeIntoVIMP',
      desc: '',
      args: [],
    );
  }

  /// `Earn`
  String get earn {
    return Intl.message(
      'Earn',
      name: 'earn',
      desc: '',
      args: [],
    );
  }

  /// `Available Rewards`
  String get availableRewards {
    return Intl.message(
      'Available Rewards',
      name: 'availableRewards',
      desc: '',
      args: [],
    );
  }

  /// `Participate`
  String get participate {
    return Intl.message(
      'Participate',
      name: 'participate',
      desc: '',
      args: [],
    );
  }

  /// `Farmers`
  String get farmers {
    return Intl.message(
      'Farmers',
      name: 'farmers',
      desc: '',
      args: [],
    );
  }

  /// `By`
  String get by {
    return Intl.message(
      'By',
      name: 'by',
      desc: '',
      args: [],
    );
  }

  /// `Latest Tasks`
  String get latestTasks {
    return Intl.message(
      'Latest Tasks',
      name: 'latestTasks',
      desc: '',
      args: [],
    );
  }

  /// `Explore Farms`
  String get exploreFarms {
    return Intl.message(
      'Explore Farms',
      name: 'exploreFarms',
      desc: '',
      args: [],
    );
  }

  /// `My Farms`
  String get myFarms {
    return Intl.message(
      'My Farms',
      name: 'myFarms',
      desc: '',
      args: [],
    );
  }

  /// `Scan to Login`
  String get qrDialogTxt {
    return Intl.message(
      'Scan to Login',
      name: 'qrDialogTxt',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized Error`
  String get un_authorized_error {
    return Intl.message(
      'Unauthorized Error',
      name: 'un_authorized_error',
      desc: '',
      args: [],
    );
  }

  /// `Connection Error`
  String get connection_error {
    return Intl.message(
      'Connection Error',
      name: 'connection_error',
      desc: '',
      args: [],
    );
  }

  /// `Canceled by the user`
  String get user_cancel_error {
    return Intl.message(
      'Canceled by the user',
      name: 'user_cancel_error',
      desc: '',
      args: [],
    );
  }

  /// `unKnown error`
  String get unknown_error {
    return Intl.message(
      'unKnown error',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get error_internal_server {
    return Intl.message(
      'Internal server error',
      name: 'error_internal_server',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please check your internet connection and try again`
  String get something_went_wrong_check_connection {
    return Intl.message(
      'Something went wrong, please check your internet connection and try again',
      name: 'something_went_wrong_check_connection',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected Error happened`
  String get error_unexpected {
    return Intl.message(
      'Unexpected Error happened',
      name: 'error_unexpected',
      desc: '',
      args: [],
    );
  }

  /// `Request to API server was cancelled`
  String get dio_cancel_error {
    return Intl.message(
      'Request to API server was cancelled',
      name: 'dio_cancel_error',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout with API server`
  String get dio_connection_timeout_error {
    return Intl.message(
      'Connection timeout with API server',
      name: 'dio_connection_timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout in connection with API server`
  String get dio_receive_connection_timeout_error {
    return Intl.message(
      'Receive timeout in connection with API server',
      name: 'dio_receive_connection_timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout in connection with API server`
  String get dio_send_timeout_to_the_server {
    return Intl.message(
      'Send timeout in connection with API server',
      name: 'dio_send_timeout_to_the_server',
      desc: '',
      args: [],
    );
  }

  /// `Bad Request!`
  String get dio_bad_request_error {
    return Intl.message(
      'Bad Request!',
      name: 'dio_bad_request_error',
      desc: '',
      args: [],
    );
  }

  /// `Not found error!`
  String get dio_not_found_error {
    return Intl.message(
      'Not found error!',
      name: 'dio_not_found_error',
      desc: '',
      args: [],
    );
  }

  /// `Select passport to continue.`
  String get selectPassportToContinue {
    return Intl.message(
      'Select passport to continue.',
      name: 'selectPassportToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueStr {
    return Intl.message(
      'Continue',
      name: 'continueStr',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Translations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
