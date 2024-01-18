import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heytorus/bloc/user/user-bloc.dart';
import 'package:heytorus/bloc/user/user-events.dart';
import 'package:heytorus/bloc/user/user-state.dart';
import 'package:heytorus/widgets/master.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../styles/styles.dart' as styles;
import '../../utils/utils.dart' as utils;
import 'dart:convert';
import 'dart:io' as io;

class WetSignatureSelectionStep extends StatefulWidget {
  const WetSignatureSelectionStep({super.key});

  @override
  State<WetSignatureSelectionStep> createState() =>
      _WetSignatureSelectionStepState();
}

class _WetSignatureSelectionStepState extends State<WetSignatureSelectionStep> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Add Signature',
            style: styles.megaTitleStyle(),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Signature is mandatory to complete your KYC',
            style: styles.sectionTextStyle(
              textColor: const Color(0xff767676),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          BlocConsumer<UserBloc, UserState>(
            builder: (context, state) {
              if (wetSignatureState.showDrawSignatureBlock == false) {
                return WetSignatureSelection();
              } else {
                return DrawSignatureStep();
              }
            },
            listener: (context, state) => {},
          ),
        ],
      ),
    );
  }
}

class DrawSignatureStep extends StatelessWidget {
  DrawSignatureStep({super.key});
  final GlobalKey<SfSignaturePadState> _wetSignatureKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocConsumer<UserBloc, UserState>(
        builder: (BuildContext context, UserState state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShadowBox(
                noPadding: wetSignatureState.signatureUploadType ==
                        SignatureUploadType.draw
                    ? false
                    : true,
                noMargin: true,
                bgColor: wetSignatureState.signatureUploadType ==
                        SignatureUploadType.draw
                    ? const Color(0xfff1f1f1)
                    : Colors.transparent,
                child: (wetSignatureState.signatureUploadType ==
                        SignatureUploadType.draw)
                    ? Column(
                        children: [
                          Container(
                            color: const Color(0xfff1f1f1),
                            child: SfSignaturePad(
                              key: _wetSignatureKey,
                              onDrawEnd: () {},
                            ),
                          ),
                        ],
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: Image.file(
                          wetSignatureState.file,
                        ),
                      ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _wetSignatureKey.currentState!.clear();
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Clear Signature',
                              style: TextStyle(
                                color: Color(0xff3F7ED3),
                                fontWeight: FontWeight.w700,
                                fontSize: utils.vw(3.5, context),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'assets/icons/delete.svg',
                              width: utils.vw(4, context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: IntroButtonAlt(
                            callback: () {
                              BlocProvider.of<UserBloc>(context).add(
                                ToggleWetSignatureBlockEvent(
                                  show: false,
                                  uploadType:
                                      wetSignatureState.signatureUploadType,
                                  file: null,
                                ),
                              );
                            },
                            label: wetSignatureState.signatureUploadType ==
                                    SignatureUploadType.draw
                                ? 'Back'
                                : 'Re-Upload',
                            textColor: const Color(0xff3F7ED3),
                            backgroundColor: const Color(0xffffffff),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: IntroButtonAlt(
                            isDisabled: false,
                            callback: () {
                              BlocProvider.of<UserBloc>(context).add(
                                ChangeKYCStepEvent(
                                  step: KYCStep.previewAOFForm,
                                ),
                              );
                            },
                            label: 'Upload',
                            backgroundColor: const Color(0xff3F7ED3),
                            textColor: const Color(0xffffffff),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        listener: (BuildContext context, UserState state) {},
      ),
    );
  }
}

class WetSignatureSelection extends StatelessWidget {
  WetSignatureSelection({super.key});

  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      noMargin: true,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          SvgPicture.asset(
            'assets/icons/manual-sign.svg',
            width: 60,
          ),
          const SizedBox(
            height: 20,
          ),
          IntroButtonAlt(
            callback: () {
              BlocProvider.of<UserBloc>(context).add(
                ToggleWetSignatureBlockEvent(
                  show: true,
                  uploadType: SignatureUploadType.draw,
                  file: null,
                ),
              );
            },
            label: 'Tap here to sign manually',
            textColor: const Color(0xff3F7ED3),
            backgroundColor: const Color(0xffffffff),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 40, 0, 40),
            //color: Colors.pink,
            child: SvgPicture.asset(
              'assets/illustrations/or-divider.svg',
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
              height: 60,
            ),
          ),
          SvgPicture.asset(
            'assets/icons/upload-sign.svg',
            width: 60,
          ),
          const SizedBox(
            height: 20,
          ),
          IntroButtonAlt(
            callback: () async {
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              print(image);
              List<int> imageBytes = io.File(image!.path).readAsBytesSync();
              String img64 = base64Encode(imageBytes);
              print(img64);

              File file = File(image.path);

              BlocProvider.of<UserBloc>(context).add(
                ToggleWetSignatureBlockEvent(
                  show: true,
                  uploadType: SignatureUploadType.upload,
                  file: file,
                ),
              );
            },
            label: 'Upload Signature',
            textColor: const Color(0xff3F7ED3),
            backgroundColor: const Color(0xffffffff),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
