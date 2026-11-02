// Convierte precios de cacao de USD por quintal a USD por kilogramo.
void main() {
  const double kilogramosPorQuintal = 45.36;
  final List<double> preciosPorQuintal = [95.00, 100.00, 105.50, 110.00];

  print('CONVERSIÓN DE PRECIOS DEL CACAO');
  print('--------------------------------');

  for (final precioQuintal in preciosPorQuintal) {
    final double precioKilogramo = precioQuintal / kilogramosPorQuintal;
    print(
      '\$${precioQuintal.toStringAsFixed(2)} por quintal = '
      '\$${precioKilogramo.toStringAsFixed(2)} por kilogramo',
    );
  }
}
