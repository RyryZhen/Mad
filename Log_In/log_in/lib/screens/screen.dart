import 'package:flutter/material.dart';
import 'package:log_in/screens/home.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  var showPass = false;
  var username = TextEditingController();
  var password = TextEditingController();

  void login() {
    if (username.text == '' || password.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Username and password required!')),
      );
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Home(username: username.text, password: password.text),
      ),
    );
  }

  void toogle() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            TextField(
              controller: username,
              decoration: InputDecoration(
                label: Text('Username'),
                border: OutlineInputBorder(),
                hintText: 'Enter your username',
              ),
            ),
            TextField(
              obscureText: showPass,
              controller: password,
              decoration: InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(),
                hintText: 'Enter your password',
                suffix: IconButton(
                  onPressed: toogle,
                  icon: Icon(
                    showPass ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: login, child: Text('Log In')),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:log_in/screens/home.dart';

// class Screen extends StatefulWidget {
//   const Screen({super.key});

//   @override
//   State<Screen> createState() => _ScreenState();
// }

// class _ScreenState extends State<Screen> {
//   var toogle = true;
//   var username = TextEditingController();
//   var password = TextEditingController();

//   void toogleSet() {
//     setState(() {
//       toogle = !toogle;
//     });
//   }

//   void login() {
//     if (username.text == '' || password.text == '') {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Username and password required!')),
//       );
//       return;
//     }
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => Home(username: username.text, password: password.text),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Image.asset('assets/images/logo.png'),
//               SizedBox(height: 50),
//               TextField(
//                 controller: username,
//                 decoration: InputDecoration(
//                   label: Text('Username'),
//                   hintText: 'Enter your username',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 50),
//               TextField(
//                 obscureText: toogle,
//                 controller: password,
//                 decoration: InputDecoration(
//                   label: Text('Password'),
//                   hintText: 'Enter your password',
//                   border: OutlineInputBorder(),
//                   suffix: IconButton(
//                     onPressed: toogleSet,
//                     icon: Icon(
//                       toogle ? Icons.visibility_off : Icons.visibility,
//                     ),
//                   ),
//                 ),
//               ),
//               ElevatedButton(onPressed: login, child: Text('Log In')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
