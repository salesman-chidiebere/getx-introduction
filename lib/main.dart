import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
  decrease() => count--;
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: Text("Next Screen"),
              onPressed: () => Get.to(SecondScreen()),
            ),
          ),

          ElevatedButton(
            child: Text("Show SnackBar"),
            onPressed: () => Get.snackbar("Hurray", "We did it",
                icon: Icon(Icons.account_circle), snackPosition: SnackPosition.BOTTOM)),

          ElevatedButton(
              child: Text("Show Dialog"),
              onPressed: () => Get.defaultDialog(title: "Dialogbox",
                  content: Text("Hello Dialog",))),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  child: Text("Decrease"),
                  onPressed: () => c.decrease()),
              Obx(() =>Text("${c.count}")),
              ElevatedButton(
                  child: Text("Increment"),
                  onPressed: () => c.increment()),
            ],
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${c.count}"),
            ElevatedButton(
                onPressed: () => Get.back(),
                child: Text("Go Back")),
            ElevatedButton(
                onPressed: () {
                  Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
                child: Text("Change Theme")),
            ElevatedButton(
                onPressed: () {
                  GetUtils.isNumericOnly("12345") ? print("Hurray") : print("Booooo");
                },
                child: Text("validate Email")),

          ],
        ),
      ),
    );
  }
}



