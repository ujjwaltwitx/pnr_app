import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pnr_app/controller/provider.dart';

class PnrHistoryWidget extends ConsumerStatefulWidget {
  const PnrHistoryWidget({super.key});

  @override
  ConsumerState<PnrHistoryWidget> createState() {
    return _PnrHistoryState();
  }
}

class _PnrHistoryState extends ConsumerState<PnrHistoryWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(pnrHistoryList.notifier).streamDB();
    ref.read(pnrHistoryList.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(pnrHistoryList);
    return list.isEmpty
        ? const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("No PNR added"),
          )
        : Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                  child: const Text(
                    "PNR History",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ref.read(pnrTextEditingController).text =
                            list[index].pnrNum.toString();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        margin: const EdgeInsets.only(top: 1),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${list[index].pnrNum}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              "${list[index].source} - ${list[index].destination}",
                              style: const TextStyle(
                                  color: Color.fromARGB(164, 0, 0, 0)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: list.length,
                )
              ],
            ),
          );
  }
}
