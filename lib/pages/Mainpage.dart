import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final auth = FirebaseAuth.instance;
    Widget userImage;
    try{
      userImage = CircleAvatar(backgroundImage: NetworkImage(auth.currentUser!.photoURL!),);
      print(auth.currentUser!.photoURL!);
    }catch(e){
      userImage = const Icon(Icons.person,size:50,color: Color.fromARGB(255, 117, 117, 117),);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              userImage,
              const Text(
                'Signed in as ',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                (user?.email!).toString(),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                onPressed: () => FirebaseAuth.instance.signOut(),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 32,
                ),
                label: const Text(
                  'Sign out',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
