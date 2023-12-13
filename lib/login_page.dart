import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/navigation_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/Hive/client_hive_model.dart';



late Box<ClientHiveModel> _clients;

Future<void> main() async {
  //+ Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  _clients = await Hive.openBox<ClientHiveModel>('clientBox');
  await _clients.add(ClientHiveModel(name: "Linda", pet: "Fighter Malinois"));
  await _clients.add(ClientHiveModel(name: "Arthur", pet: "Superdog Whippet"));


  runApp(const LoginPage());
}


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController login = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE69E67),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  child: TextField(
                    controller: login,
                    decoration: InputDecoration(
                      labelText: 'Логин',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 300,
                ),
                Container(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      labelText: 'Пароль',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationPage()),
                );
              },
              child: const Text('Войти'),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                'assets/1.0x/malinois.svg',
                height: 200,
              ),
            ),
          ]),
    );
  }















  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: const Color(0xFFE69E67),
  //     body: Column(
  //         mainAxisSize: MainAxisSize.max,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Column(
  //             mainAxisSize: MainAxisSize.max,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               Container(
  //                 width: 300,
  //                 child: TextField(
  //                   controller: login,
  //                   decoration: InputDecoration(
  //                     labelText: 'Логин',
  //                     labelStyle: TextStyle(color: Colors.white),
  //                     enabledBorder: UnderlineInputBorder(
  //                       borderSide: BorderSide(color: Colors.white),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 30,
  //                 width: 300,
  //               ),
  //               Container(
  //                 width: 300,
  //                 child: TextField(
  //                   obscureText: true,
  //                   controller: password,
  //                   decoration: InputDecoration(
  //                     labelText: 'Пароль',
  //                     labelStyle: TextStyle(color: Colors.white),
  //                     enabledBorder: UnderlineInputBorder(
  //                       borderSide: BorderSide(color: Colors.white),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 30),
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => const NavigationPage()),
  //               );
  //             },
  //             child: const Text('Войти'),
  //           ),
  //           Container(
  //             alignment: Alignment.bottomCenter,
  //             child: SvgPicture.asset(
  //               'assets/1.0x/malinois.svg',
  //               height: 200,
  //             ),
  //           ),
  //         ]),
  //   );
  // }
  //





//       SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               flex: 2,
//               child: Container(
//                   alignment: Alignment.bottomCenter,
//                   child: Column(children: <Widget>[
//                     const SizedBox(height: 250),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         width: 300,
//                         child: TextField(
//                           controller: login,
//                           decoration: InputDecoration(
//                             hintText: 'Логин',
//                             hintStyle: TextStyle(color: Colors.white),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       child: TextField(
//                         controller: password,
//                         decoration: InputDecoration(
//                           hintText: 'Пароль',
//                           hintStyle: TextStyle(color: Colors.white),
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const NavigationPage()),
//                         );
//                       },
//                       child: const Text('Войти'),
//                     ),
//                   ])),
//             ),
//             Expanded(
//                 flex: 1,
//                 child: Container(
//                   alignment: Alignment.bottomCenter,
//                   child: SvgPicture.asset(
//                     'assets/1.0x/malinois.svg',
//                     height: 200,
//                   ),
//                 )),
//           ],
//         ),
//       ));
// }
















// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       backgroundColor: const Color(0xFFE69E67),
//       body: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               flex: 2,
//               child: Container(
//                   alignment: Alignment.bottomCenter,
//                   child: Column(children: <Widget>[
//                     const SizedBox(height: 250),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         width: 300,
//                         child: TextField(
//                           controller: login,
//                           decoration: InputDecoration(
//                             hintText: 'Логин',
//                             hintStyle: TextStyle(color: Colors.white),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       child: TextField(
//                         controller: password,
//                         decoration: InputDecoration(
//                           hintText: 'Пароль',
//                           hintStyle: TextStyle(color: Colors.white),
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const NavigationPage()),
//                         );
//                       },
//                       child: const Text('Войти'),
//                     ),
//                   ])),
//             ),
//             Expanded(
//                 flex: 1,
//                 child: Container(
//                   alignment: Alignment.bottomCenter,
//                   child: SvgPicture.asset(
//                     'assets/1.0x/malinois.svg',
//                     height: 200,
//                   ),
//                 )),
//           ],
//         ),
//       ));
// }
}
