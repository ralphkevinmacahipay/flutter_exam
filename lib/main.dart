import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_exam/app/app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  String baseurl = await getBaseURL();
  runApp(App(
    baseUrl: baseurl,
  ));
/******************** NOTE ********************
 * CREATE .env file on root directory and add THIS
 BASE_URL=https://o7q6ka26qs232rmbtpbrxghy6u0vyrup.lambda-url.ap-southeast-1.on.aws/
 *
 */
}

Future<String> getBaseURL() async {
  // await dotenv.load(fileName: ".env");
  String? baseURL = dotenv.env['BASE_URL'];
  return baseURL!;
}
