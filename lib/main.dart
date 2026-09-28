// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());   // main function return gardaina
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'Modern Login', home: const HomePage());
//
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(title: Text("Home"),
//       backgroundColor: Colors.green,),
//       body: Column(
//         children:[
//           Text("Hello World"),
//           Text("This is Text"),
//
//           Row(
//             mainAxisAlignment:MainAxisAlignment.spaceEvenly, children: [
//               ElevatedButton(onPressed: (){}, child: Text("Click Me!")),
//               ElevatedButton(onPressed: (){}, child: Text("Click Me!")),
//               ElevatedButton(onPressed: (){}, child: Text("Click Me!")),
//             ]
//           ),
//     Text("Hello World!"),
//     Text("This is Text!", style: TextStyle(fontStyle: FontStyle.italic)),
//     Text("This is Text!", style: TextStyle(fontWeight: FontWeight.bold)),
//     Text("This is Text!", style: TextStyle(fontSize: 120)),
//
//           SizedBox(height: 10),
//           TextField(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             labelText: "Email"
//           ),
//           ),TextField(
//       decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           labelText: "password"
//       ),
//       obscureText: true,
//           ),
//           TextButton(onPressed: (){}, child:Text("Click Here!"))
//
//     ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const LoginPage(),
    );
  }
}
