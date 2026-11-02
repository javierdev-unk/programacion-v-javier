// Función flecha que determina si un número de parcela es par o impar.
String clasificarParcela(int numeroParcela) =>
    numeroParcela.isEven ? 'par' : 'impar';

void main() {
  final List<int> parcelas = [1, 2, 7, 12, 25];

  print('CLASIFICACIÓN DE PARCELAS');
  print('--------------------------');

  for (final numero in parcelas) {
    print('La parcela $numero es ${clasificarParcela(numero)}.');
  }
}
