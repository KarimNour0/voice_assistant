import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:voice_assistant/constant.dart';


class openAIServer{
  // Future<String> IsArtPromptAI(String Prompt) async{
  //   try {
  //    final res = await http.post(Uri.parse('https://api.openai.com/v1/completions'));
  //    headers : {
  //      'Content-Type' : 'application/json',
  //   'Authorization': 'Bearer $openAIKey' ,
  //
  //    },
  //    body : jsonEncode({}
  //   )
  //   }
  //   catch (e) {
  //
  //   }
  //
  // }

  final List<Map<String , String>> messages =[];

  Future<String> IsArtPromptAI(String prompt) async {
  try {
      final res = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $openAIKey',
      },
      body: jsonEncode({
      "model": "gpt-3.5-turbo",
        'messages' : [
          {
            'role' : "user",
            'content' : 'Does this message want to generate an AI picture ,image , Art or any thing similar  ? $prompt . Simply answer with yes or No.  ',

          }
        ],
      }),
  );
      print(res.body);

      if (res.statusCode == 200) {
          final responseJson = jsonDecode(res.body);
          responseJson['choices'][0]['messages']['content'];

          responseJson.trim();///عشان تشيل اي مسافه ملهاش لازمه

          switch (responseJson){
            case 'yes' :
              case 'yes' :
                case 'yes' :
                  case 'yes' :
                   final res = await Dalle(prompt);
                   return res;
            default :
              final res = await ChatGPT(prompt);
              return res;

          }


      }
      else {
      throw Exception('Failed to load data from OpenAI server');
      }
  } catch (e) {
  print('Error: $e');
  return 'null';
  }
  }

  Future<String> ChatGPT(String prompt) async {
  // TODO: Implement ChatGPT method

    messages.add({
      'role' : "user",
      'content' : prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          'messages' : messages,

        }),
      );
      print(res.body);

      if (res.statusCode == 200) {
        final responseJson = jsonDecode(res.body);
        responseJson['choices'][0]['messages']['content'];

        responseJson.trim();///عشان تشيل اي مسافه ملهاش لازمه
        messages.add({
          'role' : "user",
          'content' : responseJson,
        });
      }
      else {
        throw Exception('Failed to load data from OpenAI server');
      }
    } catch (e) {
      print('Error: $e');
      return 'null';
    }
  return 'Chat';
  }
  Future<String> Dalle(String prompt) async {
  // TODO: Implement ChatGPT method

    messages.add({
      'role' : "user",
      'content' : prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/images/generations'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIKey',
        },
        body: jsonEncode({
          {
            "prompt": "A cute baby sea otter",
            "n": 1,
            "size": "1024x1024"
          }


        }),
      );
      print(res.body);

      if (res.statusCode == 200) {
        final imageurl = jsonDecode(res.body);
        imageurl['choices'][0]['data']['url'];

        imageurl.trim();///عشان تشيل اي مسافه ملهاش لازمه
        messages.add({
          'role' : "user",
          'content' : imageurl,
        });
      }
      else {
        throw Exception('Failed to load data from OpenAI server');
      }
    } catch (e) {
      print('Error: $e');
      return 'null';
    }
  return 'Chat';
  }
  }
