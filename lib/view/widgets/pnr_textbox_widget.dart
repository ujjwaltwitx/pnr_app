import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/provider.dart';
import '../../utilities/utility_functions.dart';
import '../pnr_status_page.dart';

class PnrTextBox extends ConsumerStatefulWidget {
  const PnrTextBox({super.key});
  @override
  ConsumerState<PnrTextBox> createState() {
    return _PnrTextBoxWidget();
  }
}

class _PnrTextBoxWidget extends ConsumerState<PnrTextBox> {
  TextEditingController? pnrTextController;
  TextEditingController? ansTextController;
  @override
  void initState() {
    ref.read(cookieProvider.notifier).updateCookie();
    pnrTextController = ref.read(pnrTextEditingController);
    ansTextController = ref.read(ansTextEditingController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String imgUrl = ref.watch(imgUrlProvider);
    final cookie = ref.watch(cookieProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 175, 174, 174),
            offset: Offset(1, 1),
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(3)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              controller: pnrTextController,
              // onChanged: (value) {
              //   ref.read(pnrProvider.notifier).state =
              //       value == "" ? 0 : int.parse(value);
              // },
              decoration: const InputDecoration(
                hintText: "Enter your PNR",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Color.fromARGB(255, 175, 176, 175),
                  ),
                ),
              ),
              // cursorHeight: 24,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                imgUrl,
                                headers: {'cookie': cookie},
                              ),
                            ),
                          ),
                        )),
                        Material(
                          child: IconButton(
                            icon: const Icon(Icons.replay_outlined),
                            splashRadius: 20,
                            splashColor: Colors.blue,
                            onPressed: () async {
                              ref.read(imgUrlProvider.notifier).state =
                                  generateImgUrl();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: const InputDecoration(hintText: "Answer"),
                    controller: ansTextController,
                    // onChanged: (value) {
                    //   ref.read(ansProvider.notifier).state = int.parse(value);
                    // },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (pnrTextController!.text == "" ||
                      ansTextController!.text == "") {
                    return;
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PnrStatusPage(UniqueKey()),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
                child: const Text("Check PNR"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
