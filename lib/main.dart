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
      body: Stack(
        fit: StackFit
            .expand, // Faz com que o conteúdo preencha todo o espaço disponível
        children: [
          // Widget Container que exibe o wallpaper como fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/etica-wallpaper.jpg'),
                fit: BoxFit
                    .cover, // Redimensiona a imagem para preencher o container
              ),
            ),
          ),
          // Widget Align que posiciona o conteúdo na parte inferior centralizada
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 32), // Adiciona um espaço inferior para o botão
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
        ],
      ),
    );
  }
}
