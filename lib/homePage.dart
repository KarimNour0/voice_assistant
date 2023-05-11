// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart';
// import 'package:voice_assistant/constant.dart';
// import 'package:voice_assistant/openAiServer.dart';
//
// class HomePage extends StatefulWidget {
//   // const HomePage({Key? key}) : super(key: key);
//
//
//
//   @override
//   State<HomePage> createState() => _HomePageState();
//
// }
//
// class _HomePageState extends State<HomePage> {
//
//   final speechToText = SpeechToText();
//   // FlutterTts flutterTts = FlutterTts();
//   String lastWords ='';
//   final openAIServer openAiServer = openAIServer();
//   String? generatedcontent;
//   String? generatedImageUrl;
//   int start = 200;
//   int delay = 200;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initSpeechToText();
//     // initSpeechRecognizer();
//   }
//
//   Future<void> initSpeechToText()async {
//       await speechToText.initialize();
//       setState(() {
//       });
//   }
//
//   // void initSpeechRecognizer() async {
//   //   bool available = await speechToText.initialize();
//   //   if (available) {
//   //     // Speech to text plugin is initialized, you can now use its methods
//   //   } else {
//   //     // Speech to text plugin failed to initialize
//   //   }
//   // }
//
//   /// Each time to start a speech recognition session
//   /// لما الشخص يتكلم من المكرفون الميثود دي بتسمع الكلام وبتحوله لنصوص
//   // Future<void> _startListening() async {
//   //   await speechToText.listen(onResult: _onSpeechResult);
//   //   setState(() {});
//   // }
//
//   Future<void> _startListening() async {
//     try {
//       await speechToText.listen(onResult: _onSpeechResult);
//       setState(() {});
//     } on SpeechToTextNotInitializedException catch (e) {
//       // Handle the exception here
//       print('SpeechToTextNotInitializedException: $e');
//       await initSpeechToText();
//     }
//   }
//
//   /// Manually stop the active speech recognition session
//   /// Note that there are also timeouts that each platform enforces
//   /// and the SpeechToText plugin supports setting timeouts on the
//   /// listen method.
//   Future<void> _stopListening() async {
//     await speechToText.stop();
//     setState(() {});
//   }
//
//   /// This is the callback that the SpeechToText plugin calls when
//   /// the platform returns recognized words.
//   void _onSpeechResult(SpeechRecognitionResult result) {
//     setState(() {
//       lastWords = result.recognizedWords;
//     });
//   }
//
//   Future<void> speak() async{
//     // var result = await flutterTts.speak("Hello World");
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     speechToText.stop();
//     // flutterTts.stop();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: BounceInDown(child: Text('Allen')),
//         centerTitle: true,
//         leading:  Icon(Icons.menu,),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // SizedBox(height: 45,),
//             ZoomIn(
//               child: Stack(
//                 children: [
//                   Center(
//                     child: Container(
//                       width: 90,
//                       height: 100,
//                       child: CircleAvatar(
//                         backgroundColor: platte.assistantCircleColor
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Container(
//                       width: 120,
//                       height: 115,
//                       child: CircleAvatar(
//                             child: Image.asset('assets/images/virtualAssistant.png'),
//     )
//     ),
//                     ),
//
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             FadeInRight(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 30,
//                   vertical: 5,
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: platte.borderColor
//                     ),
//                     borderRadius: BorderRadius.circular(20).copyWith(
//                       topLeft: Radius.zero ,
//                     )
//                   ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 20,
//                       ),
//                       child: Text('Good Morning , What task can I Do for you ?',
//                       style: TextStyle(color: platte.mainFontColor , fontSize: 25 ,
//                       fontFamily: 'Cero pro)',)),
//                     ),
//
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             SlideInLeft(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 30
//                 ),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Here are a few commands:',
//                     style: TextStyle(
//                       color: platte.mainFontColor,
//                       fontSize: 20,
//                       fontFamily: 'Cero Pro',
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Column(
//               children: [
//                 SlideInLeft(
//                   delay: Duration(milliseconds: start),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 30,
//                       vertical: 10,
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: platte.firstSuggestionBoxColor,
//                           border: Border.all(
//                               color: platte.borderColor
//                           ),
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 20,
//                           vertical: 20,
//                         ),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Chat GPT',
//                                   style: TextStyle(color: platte.mainFontColor , fontSize: 25 ,
//                                       fontFamily: 'Cero pro)', fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('A Smarter way to stay organized and informed in Chat GPT',
//                                   style: TextStyle(color: platte.mainFontColor , fontSize: 18 ,
//                                     fontFamily: 'Cero pro)',)),
//                             ]
//                         ),
//                       ),
//
//
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 SlideInLeft(
//                   delay: Duration(milliseconds: start + delay),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 30,
//                       vertical: 5,
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: platte.secondSuggestionBoxColor,
//                           border: Border.all(
//                               color: platte.borderColor
//                           ),
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 20,
//                           vertical: 10,
//                         ),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Dall-E',
//                                   style: TextStyle(color: platte.mainFontColor , fontSize: 25 ,
//                                       fontFamily: 'Cero pro)', fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('Get inspired and stay creative with your personal assistant powered by Dall-E',
//                                   style: TextStyle(color: platte.mainFontColor , fontSize: 18 ,
//                                     fontFamily: 'Cero pro)',)),
//                             ]
//                         ),
//                       ),
//
//
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 SlideInLeft(
//                   delay: Duration(milliseconds: start + delay),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 30,
//                       vertical: 10,
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: platte.thirdSuggestionBoxColor,
//                           border: Border.all(
//                               color: platte.borderColor
//                           ),
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 10,
//                         ),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text( 'Smart Voice Assistant',
//                                   style: TextStyle(color: platte.mainFontColor , fontSize: 25 ,
//                                       fontFamily: 'Cero pro)', fontWeight: FontWeight.bold)),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text('Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
//                                   style: TextStyle(color: platte.mainFontColor , fontSize: 18 ,
//                                     fontFamily: 'Cero pro)',)),
//                             ]
//                         ),
//                       ),
//
//
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: platte.secondSuggestionBoxColor,
//         onPressed: () async {
//           if(await speechToText.hasPermission && speechToText.isNotListening){   ///isNotListening  معناها ان الريكورد مش قيد التشغيل يعني لسه مقفول
//             await _startListening();
//           }
//           else if (speechToText.isListening){
//            await openAIServer().IsArtPromptAI(lastWords);
//             await speak();
//              await _stopListening();
//           }
//           else{
//             initSpeechToText();
//           }
//         },
//       child: Icon(Icons.mic , color: platte.blackColor,),),
//     );
//   }
// }



import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_assistant/constant.dart';
import 'package:voice_assistant/openAiServer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  String lastWords = '';
  final openAIServer openAIService = openAIServer();
  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(
          child: const Text('Allen'),
        ),
        leading: const Icon(Icons.menu),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // virtual assistant picture
            ZoomIn(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(top: 4),
                      decoration: const BoxDecoration(
                        color: platte.assistantCircleColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Container(
                    height: 123,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/virtualAssistant.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // chat bubble
            FadeInRight(
              child: Visibility(
                visible: generatedImageUrl == null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                    top: 30,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: platte.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(20).copyWith(
                      topLeft: Radius.zero,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      generatedContent == null
                          ? 'Good Morning, what task can I do for you?'
                          : generatedContent!,
                      style: TextStyle(
                        fontFamily: 'Cera Pro',
                        color: platte.mainFontColor,
                        fontSize: generatedContent == null ? 25 : 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (generatedImageUrl != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(generatedImageUrl!),
                ),
              ),
            SlideInLeft(
              child: Visibility(
                visible: generatedContent == null && generatedImageUrl == null,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10, left: 22),
                  child: const Text(
                    'Here are a few features',
                    style: TextStyle(
                      fontFamily: 'Cera Pro',
                      color: platte.mainFontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // features list
          Column(
              children: [
                SlideInLeft(
                  delay: Duration(milliseconds: start),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: platte.firstSuggestionBoxColor,
                          border: Border.all(
                              color: platte.borderColor
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Chat GPT',
                                  style: TextStyle(color: platte.mainFontColor , fontSize: 25 ,
                                      fontFamily: 'Cero pro)', fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('A Smarter way to stay organized and informed in Chat GPT',
                                  style: TextStyle(color: platte.mainFontColor , fontSize: 18 ,
                                    fontFamily: 'Cero pro)',)),
                            ]
                        ),
                      ),


                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SlideInLeft(
                  delay: Duration(milliseconds: start + delay),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 5,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: platte.secondSuggestionBoxColor,
                          border: Border.all(
                              color: platte.borderColor
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Dall-E',
                                  style: TextStyle(color: platte.mainFontColor , fontSize: 25 ,
                                      fontFamily: 'Cero pro)', fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Get inspired and stay creative with your personal assistant powered by Dall-E',
                                  style: TextStyle(color: platte.mainFontColor , fontSize: 18 ,
                                    fontFamily: 'Cero pro)',)),
                            ]
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SlideInLeft(
                  delay: Duration(milliseconds: start + 2* delay),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: platte.thirdSuggestionBoxColor,
                          border: Border.all(
                              color: platte.borderColor
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( 'Smart Voice Assistant',
                                  style: TextStyle(color: platte.mainFontColor , fontSize: 25 ,
                                      fontFamily: 'Cero pro)', fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
                                  style: TextStyle(color: platte.mainFontColor , fontSize: 18 ,
                                    fontFamily: 'Cero pro)',)),
                            ]
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: ZoomIn(
        delay: Duration(milliseconds: start + 3 * delay),
        child: FloatingActionButton(
          backgroundColor: platte.secondSuggestionBoxColor,
          onPressed: () async {
            if (await speechToText.hasPermission &&
                speechToText.isNotListening) {
              await startListening();
            } else if (speechToText.isListening) {
              final speech = await openAIService.IsArtPromptAI(lastWords);
              if (speech.contains('https')) {
                generatedImageUrl = speech;
                generatedContent = null;
                setState(() {});
              } else {
                generatedImageUrl = null;
                generatedContent = speech;
                setState(() {});
                await systemSpeak(speech);
              }
              await stopListening();
            } else {
              initSpeechToText();
            }
          },
          child: Icon(
            speechToText.isListening ? Icons.stop : Icons.mic,
          ),
        ),
      ),
    );
  }
}
