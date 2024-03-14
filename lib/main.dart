import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_bottonn_nav/RiveModel.dart';

void main() {
  runApp(const BottonNavWithAnimatedIcons());
}

const Color bottonNavBgColor = Color(0xFF17203A);

class BottonNavWithAnimatedIcons extends StatefulWidget {
  const BottonNavWithAnimatedIcons({super.key});

  @override
  State<BottonNavWithAnimatedIcons> createState() =>
      _BottonNavWithAnimatedIconsState();
}

class _BottonNavWithAnimatedIconsState
    extends State<BottonNavWithAnimatedIcons> {
  List<SMIBool> riveIconInputs = [];
  List<StateMachineController> controllers = [];
  int selectedNavIndex = 0;

  void riveOnInit(Artboard artboard, {required String stateMachineName}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);

    artboard.addController(controller!);
    controllers.add(controller);

    riveIconInputs.add(controller.findInput<bool>('active') as SMIBool);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: SafeArea(
            child: Container(
          height: 56,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              color: bottonNavBgColor.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                    color: bottonNavBgColor.withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 20),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                bottomNavItems.length,
                (index) => SizedBox(
                      height: 36,
                      width: 36,
                      child: RiveAnimation.asset(
                        bottomNavItems[index].src,
                        artboard: bottomNavItems[index].artboard,
                        onInit: (artboard) {
                          //riveOnInit(artboard, stateMachineName: riveIcon.stateMachineName);
                        },
                      ),
                    )),
          ),
        )),
      ),
    );
  }
}
