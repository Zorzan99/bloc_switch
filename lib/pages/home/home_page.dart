import 'package:bloc_switch/pages/home/widgets/float_button_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF73AEF5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Tarefas'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: const Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "ola",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatButtonHome(),
    );
  }
}
