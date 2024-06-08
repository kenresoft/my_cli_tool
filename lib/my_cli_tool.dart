import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('name', abbr: 'n', defaultsTo: 'world', help: 'Name to greet')
    ..addFlag('help',
        abbr: 'h', negatable: false, help: 'Show this help message')
    ..addFlag('list', abbr: 'l', negatable: false, help: 'List all commands');

  try {
    final args = parser.parse(arguments);

    if (args['help'] as bool) {
      print('Usage: my_cli_tool [options]');
      print(parser.usage);
      return;
    }

    if (args['list'] as bool) {
      print('Available commands:');
      print('  --name, -n: Name to greet');
      print('  --help, -h: Show this help message');
      print('  --list, -l: List all commands');
      return;
    }

    final name = args['name'] as String;
    print('Hello, $name!');
    // print(args['help'] as bool);
    if (name == 'help') {
      print(parser.usage);
    }
  } catch (e) {
    if (e is FormatException) {
      print('Error: ${e.message}');
      print('Usage: my_cli_tool [options]');
      print(parser.usage);
    } else {
      print('Unexpected error: $e');
    }
  }
}
