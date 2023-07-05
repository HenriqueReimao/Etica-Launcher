import 'package:launcher_etica/apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Launcher Ética',
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              switch (settings.name) {
                case "apps":
                  return AppsPage();
                default:
                  return HomePage();
              }
            },
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  void navigateToApps(BuildContext context) {
    Navigator.pushNamed(context, "apps");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Launcher Ética',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(160, 93, 44, 255),
        elevation: 0,
        child: Container(
          height: 70,
          child: Center(
            child: GestureDetector(
              onTap: () => navigateToApps(context),
              child: ElevatedButton(
                onPressed: () => navigateToApps(context),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.all(10),
                ),
                child: Image.asset(
                  'assets/image/logo.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
