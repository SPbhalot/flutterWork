// import 'package:esign_plugin/digio_config.dart';
// import 'package:esign_plugin/environment.dart';
// import 'package:esign_plugin/esign_plugin.dart';
// import 'package:esign_plugin/gateway_event.dart';
import 'package:flutter/material.dart';
import 'package:heytorus/layouts/default.dart';

class TestEsignPage extends StatefulWidget {
  const TestEsignPage({super.key});

  @override
  State<TestEsignPage> createState() => _TestEsignPageState();
}

class _TestEsignPageState extends State<TestEsignPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      widgetList: const [
        Text('ss'),
        // SmartFaceCamera(
        //   autoCapture: false,
        //   defaultCameraLens: CameraLens.front,
        //   message: 'Center your face in the square',
        //   onCapture: (File? image) {},
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(30),
        //   child: ElevatedButton(
        //     onPressed: () async {
        //       var digioConfig = DigioConfig();
        //       digioConfig.theme.primaryColor = "#32a83a";
        //       digioConfig.logo = "https://your_logo_url";
        //       digioConfig.environment = Environment.SANDBOX;

        //       final esignPlugin = EsignPlugin(digioConfig);
        //       esignPlugin
        //           .setGatewayEventListener((GatewayEvent? gatewayEvent) {
        //         print("gateway : $gatewayEvent");
        //       });
        //       var esignResult = await esignPlugin.start(
        //           "DID231122115152568YJ3PRTIQTI1S1O",
        //           "siddhesh@greyaxis.io",
        //           "GWT***",
        //           null);
        //       print('esignResult : $esignResult');
        //     },
        //     child: const Text(
        //       'Test E-Sign',
        //       style: TextStyle(fontSize: 20),
        //     ),
        //   ),
        // )
      ],
      pageTitle: 'Test E-sign',
      navType: 'mf',
    );
  }
}
