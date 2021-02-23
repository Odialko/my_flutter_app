import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:async/async.dart' show StreamGroup;
import 'package:grinder/grinder.dart';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';


const _locoUrl =
    'https://localise.biz:443/api/export/archive/arb.zip?path=lib%2Fl10n%2Fintl_%7B%25lang%7D.arb&key=t1YnOq1qffItpiFGJS6wrQPFRT5hI2ak';
const _wrkDir = '.loco';
const _locoZipFilename = 'loco.zip';
const _l10nDir = 'lib/l10n';

main(args) => grind(args);



/// Update l10n
@Task('Update l10n files ')
Future<void> l10n() async {
  log('Starting download of arb files.');
  await _downloadLanguages();

  log('Generating l10n messages with intl_utils.');
  return _logProcessOutput(
    Process.start(
      'flutter',
      ['pub', 'run', 'intl_utils:generate'],
    ),
  );
}

/// Download the arb files as a ZIP from Loco
Future<void> _downloadLanguages() async {
  final uri = Uri.parse(_locoUrl);
  final client = HttpClient();

  await client
      .getUrl(uri)
      .then((HttpClientRequest request) {
    return request.close();
  })
      .then((HttpClientResponse response) async {
    String workDirPath = await _getWorkingDir();
    String zipFilePath = await _getFilePath(workDirPath);
    log('Downloading translations zip file to ${zipFilePath}');

    await response.pipe(File(zipFilePath).openWrite());
    await _unpack10nZip(zipFilePath);
    return _cleanWorkingDir();
  })
      .catchError((err) => log)
      .whenComplete(() => client.close(force: true));
}

/// Create a temp directory to process the arb files
Future<String> _getWorkingDir() async {
  var dir = Directory(_wrkDir);

  if (await dir.exists()) {
    await dir.delete(recursive: true);
  }
  await dir.create(recursive: true);

  return dir.path;
}

Future<void> _cleanWorkingDir() async {
  var dir = Directory(_wrkDir);

  if (await dir.exists()) {
    log('Deleteing working directory ${_wrkDir}');
    await dir.delete(recursive: true);
  }
}

/// Create a filename for the downloaded Loco zip file
Future<String> _getFilePath(String dirPath) async {
  final now = DateTime.now();
  final fileName = '${now.year}${now.month}${now.day}_${_locoZipFilename}';

  return path.join(dirPath, fileName);
}

/// Unzip the arb files from the Loco zip file
Future<void> _unpack10nZip(String filePath) async {
  log('Unzipping ${filePath}');

  final bytes = File(filePath).readAsBytesSync();
  final archive = ZipDecoder().decodeBytes(bytes);

  var unpackedFileCount = 0;

  for (final file in archive) {
    final archivedFilename = file.name;
    if (file.isFile && archivedFilename.endsWith('.arb')) {
      final data = file.content as List<int>;
      final fileName = path.split(archivedFilename).last;

      log('Saving ${fileName} to ${_l10nDir}');

      await File(path.join(_l10nDir, fileName))
        ..createSync(recursive: true)
        ..writeAsBytesSync(data);
      unpackedFileCount++;
    }
  }
  log('Unzipping complete. Unpacked ${unpackedFileCount} .arb files');
}

Future<void> _logProcessOutput(Future<Process> proc) async {
  final process = await proc;
  final output = StreamGroup.merge([process.stdout, process.stderr]);
  await for (final message in output) {
    log(utf8.decode(message));
  }
}

// @Task()
// test() => new TestRunner().testAsync();
//
// @DefaultTask()
// @Depends(test)
// build() {
//   Pub.build();
// }
//
// @Task()
// clean() => defaultClean();