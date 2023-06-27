import 'package:flutter/material.dart';
import 'package:omni_jitsi_meet/feature_flag/feature_flag.dart' as flag;
import 'package:omni_jitsi_meet/jitsi_meet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  joinMeet() async {
    flag.FeatureFlag featureFlag = flag.FeatureFlag();
    featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;

    final options = JitsiMeetingOptions(
      room: 'teste',
      serverURL: 'https://meet.jit.si/Rodrigo',
      userDisplayName: 'teste',
    );

    await JitsiMeet.joinMeeting(options);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          joinMeet();
        },
        child: const Icon(Icons.meeting_room),
      ),
    );
  }
}
