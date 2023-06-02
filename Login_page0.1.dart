import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F233B),
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        backgroundColor: Color(0xFF1F233B),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //lock image
            //username
            Text(
              "Username:",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              ),
            ),
            //password
            Text(
              "Password:",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              ),
            ),
            //login button
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
              child: ElevatedButton(
                onPressed: () {},
                style:
                    ElevatedButton.styleFrom(primary: Color(0xFF1F233B)),
                child:
                    Text("Login", style: TextStyle(color: Colors.white)),
              ),
            ),

            // divider with text "or"
            Row(children:[
              Expanded(child:
                Divider(thickness :0.5, color :Colors.white,),
              ),
              Padding(padding:
                EdgeInsets.symmetric(horizontal :10.0),
                child:
                  Text("or", style:
                    TextStyle(color :Colors.white, fontWeight :FontWeight.bold)
                  )
              ),
              Expanded(child:
                Divider(thickness :0.5, color :Colors.white,),
              )
            ]),

            // sign in button
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal :25.0, vertical :25.0),
              child:
                ElevatedButton(onPressed :(){},
                  style :
                    ElevatedButton.styleFrom(primary :Color(0xFF1F233B)),
                  child :
                    Text("Sign In", style :
                      TextStyle(color :Colors.white)
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
