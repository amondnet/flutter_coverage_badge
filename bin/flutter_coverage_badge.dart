import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter_coverage_badge/src/collector.dart';

Future main(List<String> args) async {
  final package = Directory.current;
  final parser = new ArgParser();

  parser.addFlag('help', abbr: 'h', help: 'Show usage', negatable: false);
  parser.addFlag('badge',
      help: 'Generate coverage badge SVG image in your package root',
      defaultsTo: true);

  final options = parser.parse(args);

  final lineCoverage = calculateLineCoverage(File('coverage/lcov.info'));
  generateBadge(package, lineCoverage);
}
