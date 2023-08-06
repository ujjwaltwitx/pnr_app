import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pnr_app/controller/provider.dart';
// import 'package:flutter/widgets.dart';

class PnrStatusPage extends ConsumerStatefulWidget {
  const PnrStatusPage({super.key});
  @override
  ConsumerState<PnrStatusPage> createState() {
    return _PnrStatusState();
  }
}

class _PnrStatusState extends ConsumerState<PnrStatusPage> {
  @override
  void initState() {
    super.initState();
    ref.read(pnrDetailProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    final pnrDetail = ref.watch(pnrDetailProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("${pnrDetail.trainNumber} ${pnrDetail.trainName}"),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                ref.read(pnrHistoryList.notifier).addNew(
                      int.parse(pnrDetail.pnrNumber),
                      pnrDetail.sourceStation,
                      pnrDetail.destinationStation,
                    );
              },
              icon: const Icon(Icons.add_circle_outline))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
            color: Colors.blue,
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                          text: "on  ",
                          style: TextStyle(
                              color: Color.fromARGB(157, 255, 255, 255))),
                      TextSpan(
                        text: DateFormat.MMM()
                            .format(DateTime(2000, pnrDetail.doj.month)),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: " ${pnrDetail.doj.day}, ",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: "${pnrDetail.doj.hour} : ${pnrDetail.doj.minute}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pnrDetail.sourceStation,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "- ${pnrDetail.distance}km -",
                      style: const TextStyle(
                          color: Color.fromARGB(157, 255, 255, 255),
                          fontSize: 12),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          pnrDetail.destinationStation,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PNR ${pnrDetail.pnrNumber}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Tier ${pnrDetail.journeyClass}",
                      style: const TextStyle(
                          fontSize: 14, color: Color.fromARGB(160, 0, 0, 0)),
                    ),
                  ],
                ),
                Text(pnrDetail.chartStatus)
              ],
            ),
          ),
          ...List.generate(pnrDetail.passengerList.length, (index) {
            return EachPassengerDetail(
              pnrDetail.passengerList[index].passengerSerialNumber,
              pnrDetail.passengerList[index].bookingStatusDetails,
              pnrDetail.passengerList[index].currentStatus == "CNF"
                  ? true
                  : false,
            );
          })
        ],
      ),
    );
  }
}

class EachPassengerDetail extends StatelessWidget {
  final int serialNumber;
  final String bookingStatus;
  final bool confirmed;
  const EachPassengerDetail(
    this.serialNumber,
    this.bookingStatus,
    this.confirmed, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 1, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Passenger $serialNumber",
            style: const TextStyle(color: Colors.blue),
          ),
          Text(bookingStatus),
          Row(
            children: [
              Icon(
                confirmed ? Icons.verified : Icons.brightness_1,
                color: confirmed ? Colors.green : Colors.amber[300],
                size: 16,
              ),
              Text(
                confirmed ? " Confirmed" : " Unconfirmed",
                style:
                    TextStyle(color: confirmed ? Colors.green : Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}
