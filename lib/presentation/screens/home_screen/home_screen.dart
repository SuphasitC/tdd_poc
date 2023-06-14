import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdd_poc/dependency_injection.dart';
import 'package:tdd_poc/presentation/screens/home_screen/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _ctrl = sl<HomeScreenController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _ctrl.getGreeting();
      await _ctrl.getUserByIdAndPassword('xxx', 'password');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _ctrl,
      child: Consumer<HomeScreenController>(
        builder: (context, ctrl, child) {
          return Scaffold(
            body: Center(
              child: ctrl.isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(ctrl.greeting?.greetingString ?? ""),
                        const SizedBox(height: 20),
                        Text(
                          "Firstname: ${ctrl.user?.firstName ?? "Nothing"} ",
                        ),
                        Text(
                          "Lastname: ${ctrl.user?.lastName ?? "NothingLastname"} ",
                        ),
                        Text("age: ${ctrl.user?.age}"),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
