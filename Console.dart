import 'dart:async';
import 'dart:math';

const List<String> lugares = [
  "Puerto Ayacucho", "Barcelona", "San Fernando de Apure", "Maracay", "Barinas",
  "Ciudad Bolívar", "Valencia", "San Carlos", "Tucupita", "Caracas", "Coro",
  "San Juan de los Morros", "Barquisimeto", "Merida", "Los Teques", "Maturín",
  "LA Asunción", "Guanare", "Cumaná", "San Cristóbal", "Trujillo", "La Guaira",
  "San Felipe", "Maracaibo"
];

const List<String> climas = ["Nublado", "Lluvioso", "Soleado", "Con Tormenta", "Nevado"];

final Random random = Random();

Map<String, dynamic> generarDatosClima() {
  return {
    'lugar': lugares[random.nextInt(lugares.length)],
    'temperatura': random.nextInt(100) + 1,
    'clima': climas[random.nextInt(climas.length)],
  };
}


Future<void> procesarTemperatura(Map<String, dynamic> datos) async {
  await Future.delayed(Duration(seconds: 7));
  print("Alerta de cambio de clima en ${datos['lugar']}: ${datos['clima']} con ${datos['temperatura']}°C");
}


Stream<Map<String, dynamic>> obtenerStreamDeClima() async* {
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    yield generarDatosClima();
  }
}

void main() async {
  final streamClima = obtenerStreamDeClima();

  streamClima.listen((datos) {
    print("Recibiendo datos: $datos");
    procesarTemperatura(datos);
  });
}

