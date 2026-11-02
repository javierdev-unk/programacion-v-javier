// Aplica nulabilidad, el operador ?? y switch para informar el clima.
void main() {
  String? estado;

  print('Estado recibido: ${estado ?? 'Sin información del clima'}');

  // Se asigna un valor para demostrar la evaluación mediante switch.
  estado = 'soleado';

  switch (estado) {
    case 'soleado':
      print('El día está soleado: se recomienda protegerse del sol.');
      break;
    case 'nublado':
      print('El cielo está nublado: podría cambiar el tiempo.');
      break;
    case 'lluvia':
      print('Está lloviendo: se recomienda llevar paraguas.');
      break;
    default:
      print('Estado del clima no reconocido.');
  }
}
