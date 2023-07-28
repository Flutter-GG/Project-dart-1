import 'dart:convert' show utf8;

import 'Classes/libraryClass.dart';

void main() {
  var lib = utf8.encode(Purchase().makePurchase());
  lib;
}
