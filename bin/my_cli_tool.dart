import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as path;
import 'package:my_cli_tool/my_cli_tool.dart' as my_cli_tool;

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption('name', abbr: 'n', defaultsTo: 'world', help: 'Name to greet')
    ..addFlag('help',
        abbr: 'h', negatable: false, help: 'Show this help message')
    ..addFlag('list', abbr: 'l', negatable: false, help: 'List all commands')
    ..addOption('file', abbr: 'f', help: 'File path to write the message')
    ..addOption('filename', abbr: 'F', help: 'File name to write the message');

  try {
    final argResults = parser.parse(arguments);

    if (argResults['help'] as bool) {
      print('Usage: my_cli_tool [options]');
      print(parser.usage);
      return;
    }

    if (argResults['list'] as bool) {
      print('Available commands:');
      print('  --name, -n: Name to greet');
      print('  --help, -h: Show this help message');
      print('  --list, -l: List all commands');
      print('  --file, -f: File path to write the message');
      print('  --filename, -F: File name to write the message');
      return;
    }

    final name = argResults['name'] as String;
    final greeting = 'Hello, $name!';
    print(greeting);

    String? filePath;
    if (argResults.wasParsed('file') && argResults.wasParsed('filename')) {
      final directory = argResults['file'] as String;
      final filename = argResults['filename'] as String;
      filePath = path.join(directory, filename);
    } else if (argResults.wasParsed('file')) {
      filePath = argResults['file'] as String;
    }

    if (filePath != null) {
      final absolutePath = path.normalize(path.absolute(filePath));

      // Ensure the provided path is a file path, not a directory
      if (Directory(absolutePath).existsSync()) {
        print('Error: The provided path is a directory, not a file.');
        return;
      }

      final message = 'A simple command-line tool to greet users.';

      try {
        final file = File(absolutePath);
        file.writeAsStringSync(message);
        print('Message written to $absolutePath');
      } catch (e) {
        print('Error writing to file: $e');
      }
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
