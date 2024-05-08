// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'No Internet Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: InternetCheck(),
//     );
//   }
// }

// class InternetCheck extends StatefulWidget {
//   @override
//   _InternetCheckState createState() => _InternetCheckState();
// }

// class _InternetCheckState extends State<InternetCheck> {
//   bool isConnected = true;

//   @override
//   void initState() {
//     super.initState();
//     checkInternetConnection();
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       if (result == ConnectivityResult.none) {
//         setState(() {
//           isConnected = false;
//         });
//       } else {
//         setState(() {
//           isConnected = true;
//         });
//       }
//     });
//   }

//   Future<void> checkInternetConnection() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.none) {
//       setState(() {
//         isConnected = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('No Internet Demo'),
//       ),
//       body: isConnected ? Center(child: Text('Connected to the Internet')) : NoInternetScreen(),
//     );
//   }
// }

// class NoInternetScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'No Internet Connection',
//             style: TextStyle(fontSize: 24),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               SystemNavigator.pop();
//             },
//             child: Text('Exit'),
//           ),
//         ],
//       ),
//     );
//   }
// }
