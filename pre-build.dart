import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  print('Please type your google maps api');
  var gmaps = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));

  var dartFile = File('lib/utils/secrets.dart');
  var sink = dartFile.openWrite();
  sink.write('const GMAPS_API_KEY = "${gmaps.trim()}";');
  await sink.flush();
  await sink.close();

  var androidFile = File('android/app/src/main/res/values/secrets.xml');
  sink = androidFile.openWrite();
  sink.write('<?xml version="1.0" encoding="utf-8"?>\n');
  sink.write('<resources>\n');
  sink.write('\t<string name="google_maps_api_key">${gmaps.trim()}</string>\n');
  sink.write('</resources>');
  await sink.flush();
  await sink.close();
}
