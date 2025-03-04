import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIS 228 Assignment 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  Map<String, bool> interests = {
    "Music": false,
    "Sports": false,
    "Reading": false,
  };

  void _submit() {
    print("Name: " + nameController.text);
    print("Email: " + emailController.text);
    print(
      "Interests: ${interests.entries.where((e) => e.value).map((e) => e.key).join(', ')}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQANnz29ywPuw_rISd1Vyh0MI6DFxjaEw280soF3jGucumUnUmW6qXC6EL_saQjZ2o95xE&usqp=CAU",
                height: 200,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            const Text(
              "Interests:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              children:
                  interests.keys.map((key) {
                    return CheckboxListTile(
                      title: Text(key),
                      value: interests[key],
                      onChanged: (value) {
                        setState(() {
                          interests[key] = value!;
                        });
                      },
                    );
                  }).toList(),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
