import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pnr_app/controller/api_service.dart';
import 'package:pnr_app/utilities/utility_functions.dart';
import 'package:pnr_app/view/pnr_status_page.dart';

void main() {
  runApp(const ProviderScope(child: PnrApp()));
}

class PnrApp extends StatelessWidget {
  const PnrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      home: const PnrStatusPage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String imgUrl = ref.watch(imgUrlProvider);
    final asyncValue = ref.watch(cookieProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Check PNR",
          style: TextStyle(),
        ),
        elevation: 0,
      ),
      body: Padding(
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
                onChanged: (value) {
                  ref.read(pnrProvider.notifier).state =
                      value == "" ? 0 : int.parse(value);
                },
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
                            child: asyncValue.when(
                              data: (data) => Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      imgUrl,
                                      headers: {'cookie': data.state},
                                    ),
                                  ),
                                ),
                              ),
                              error: (error, stackTrace) =>
                                  const Text("Error loading captcha"),
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          Material(
                            child: IconButton(
                              icon: const Icon(Icons.replay_outlined),
                              splashRadius: 20,
                              splashColor: Colors.blue,
                              onPressed: () async {
                                // ref.read(cookieProvider.)
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
                      onChanged: (value) {
                        ref.read(ansProvider.notifier).state = int.parse(value);
                      },
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
                    ref.read(seatStatusProvider).getData();
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
      ),
    );
  }
}
