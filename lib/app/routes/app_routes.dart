// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const PRODUCT = _Paths.PRODUCT;
}

abstract class _Paths {
  static const HOME = '/home';
  static const PRODUCT = '/product';
}
