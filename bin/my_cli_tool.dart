import 'package:my_cli_tool/my_cli_tool.dart' as my_cli_tool;

import 'package:args/args.dart';

/* void main(List<String> arguments) {
  print('Hello world: ${my_cli_tool.calculate()}!');
} */

void main(List<String> arguments) {
  print('Hello world: ${my_cli_tool.calculate()}!');

  final parser = ArgParser()
    ..addOption('name', abbr: 'n', defaultsTo: 'world', help: 'Name to greet')
    ..addFlag('help',
        abbr: 'h', negatable: false, help: 'Show this help message');

  final argResults = parser.parse(arguments);

  if (argResults['help'] as bool) {
    print('Usage: my_cli_tool [options]');
    print(parser.usage);
    return;
  }

  final name = argResults['name'] as String;
  print('Hello, $name!');
}
