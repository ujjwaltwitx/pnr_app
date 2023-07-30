import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PnrStatusPage extends StatelessWidget {
  const PnrStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("15707 AIR KSR EXP"),
        elevation: 0,
      ),
      body: SizedBox(
        height: 500,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
              color: Colors.blue,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Wed, 2 Aug",
                        style: TextStyle(
                            color: Color.fromARGB(157, 255, 255, 255),
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "20 : 55",
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "ANVT, PF 6",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Anant Vihar Terminal",
                        style: TextStyle(
                            color: Color.fromARGB(157, 255, 255, 255),
                            fontSize: 14),
                      )
                    ],
                  ),
                  Text(
                    "-- 13hr 50m --",
                    style: TextStyle(
                        color: Color.fromARGB(157, 255, 255, 255),
                        fontSize: 12),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Wed, 2 Aug",
                        style: TextStyle(
                            color: Color.fromARGB(157, 255, 255, 255),
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "20 : 55",
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "ANVT, PF 6",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Anant Vihar Terminal",
                        style: TextStyle(
                          color: Color.fromARGB(157, 255, 255, 255),
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
