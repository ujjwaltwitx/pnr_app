import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pnr_app/utilities/utility_functions.dart';
import 'package:pnr_app/view/widgets/pnr_history_widget.dart';
import 'view/widgets/pnr_textbox_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await isarInit();
  runApp(const ProviderScope(child: PnrApp()));
}

class PnrApp extends StatelessWidget {
  const PnrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins"),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          "Check PNR",
          style: TextStyle(),
        ),
        elevation: 0,
      ),
      body: const Column(
        children: [PnrTextBox(), PnrHistoryWidget()],
      ),
    );
  }
}
