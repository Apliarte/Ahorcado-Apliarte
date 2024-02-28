import 'dart:io';
import 'dart:math';

import '../el_ahoracado.dart';
import '../listado_palabras.dart';

quieresJugar() {
  bool si = false;
  print(
      'Si quieres volver a jugar escribe si, cualquier otra cosa te hará salir del juego.');
  si = stdin.readLineSync() == 'si' ? true : false;
  if (si == false) {
    print(
        '''Gracias por jugar al ahorcado con apliarte Games. no olvides visitar apliarte.com para nuevas novedades
   _____                       _____               
  (, /  |            /)   ,   (, /  |              
    /---|      __   //          /---|   __ _/_   _ 
 ) /    |_     /_)_(/_  _(_  ) /    |_ / (_(__ _(/_
(_/         .-/             (_/                    
           (_/                                     ''');
  }

  return si;
}

String palabraOculta() {
  String texto = '';

  int i = Random().nextInt(listadoPalabras.length - 1);

  texto = listadoPalabras[i];

  return texto;
}

juegoAhorcado() {
  List letrasElegidas = [];
  String? palabra = palabraOculta();
  int intentos = 0;
  String? letra;
  List<String> adivinaPalabra = [];
  palabra.split('').forEach((element) {
    adivinaPalabra.add(' _ ');
  });
  do {
    print('''

Elige una letra del abcedario
y pulsa Enter
''');
    letra = stdin.readLineSync() ?? '';

    if (letra.length > 1) {
      print('''

***Escribe solo una letra''');
    }
    if (letra == '') {
      print('''

***Escribe algo...''');
    }
    if (!letrasElegidas.contains(letra)) {
      letrasElegidas.add(letra);
    } else if (letrasElegidas.contains(letra)) {
      print('''
***Esa letra ya
         se ha 
         elegido''');
    }
    intentos++;
    for (int i = 0; i < palabra.length; i++) {
      if (palabra[i] == letra) {
        adivinaPalabra[i] = letra;
      }
    }

    if (int.tryParse(letra) != null) {
      print('''
***NOOOOOOO 
     eso es  un   
           NUMEROOOOO ''');
    }
    print('''
---estas son las letras elegidas ${letrasElegidas}
     y tienes ${10 - intentos} intentos de 10
${ahorcado[intentos]}''');
    print(adivinaPalabra);
  } while (intentos < 10 && adivinaPalabra.join().toString() != palabra);

  if (adivinaPalabra.join().toString() == palabra) {
    print('''
*****FELICIDADES HAS GANADO UNA CAJA GAMBAS
OEEEEE
OEEEEE
OEEEE
OOOOOOOOOOEEEEEEEE era $palabra
''');
  } else if (intentos >= 10) {
    print('''
NOOOOOOO 
     HAS  
           MUERTOOOOOOOO era $palabra''');
  }
}
