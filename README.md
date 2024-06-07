# My CLI Tool

A simple command-line tool to greet users.

## Installation

Install the tool globally using Dart:

```sh
dart pub global activate my_cli_tool
```

## Usage

Run the tool with the desired options:

```sh
my_cli_tool --name Dart
```

### Options

- `-n`, `--name` : The name to greet. Default is 'world'.
- `-h`, `--help` : Show the help message.

### Example

```sh
my_cli_tool --name Flutter
```

This will output:

> `Hello, Flutter!`

A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.
