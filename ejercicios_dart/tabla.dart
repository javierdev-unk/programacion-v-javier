// Muestra, con un for anidado, la cantidad de cajas para 1 a 5 lotes.
void main() {
  const List<int> cantidadesDeCajas = [5, 10, 15, 20];

  print('TABLA DE CAJAS POR LOTES');
  print('-------------------------');

  for (final cajas in cantidadesDeCajas) {
    print('\n$cajas cajas por lote:');
    for (int lotes = 1; lotes <= 5; lotes++) {
      final int totalCajas = cajas * lotes;
      print('$cajas x $lotes lote(s) = $totalCajas cajas');
    }
  }
}
