import 'package:flutter/material.dart';

void main() => runApp(const CosechaApp());

class CosechaApp extends StatelessWidget {
  const CosechaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cosecha App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D32)),
        useMaterial3: true,
      ),
      home: const RegistroCosechaPage(),
    );
  }
}

class RegistroCosechaPage extends StatefulWidget {
  const RegistroCosechaPage({super.key});

  @override
  State<RegistroCosechaPage> createState() => _RegistroCosechaPageState();
}

class _RegistroCosechaPageState extends State<RegistroCosechaPage> {
  final _formKey = GlobalKey<FormState>();
  final _parcelaController = TextEditingController();
  final _quintalesController = TextEditingController();
  String _mensaje = 'Ingrese los datos de la cosecha.';

  @override
  void dispose() {
    _parcelaController.dispose();
    _quintalesController.dispose();
    super.dispose();
  }

  void _registrar() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _mensaje = 'Cosecha registrada: parcela ${_parcelaController.text}, '
            '${_quintalesController.text} quintales.';
      });
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de cosecha'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.agriculture, size: 84, color: Color(0xFF2E7D32)),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _parcelaController,
                    decoration: const InputDecoration(
                      labelText: 'Número de parcela',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.map),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Ingrese el número de parcela.'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _quintalesController,
                    decoration: const InputDecoration(
                      labelText: 'Producción (quintales)',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.inventory_2),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      final numero = double.tryParse(value?.trim() ?? '');
                      if (numero == null || numero <= 0) {
                        return 'Ingrese una cantidad válida mayor que cero.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    onPressed: _registrar,
                    icon: const Icon(Icons.save),
                    label: const Text('Registrar cosecha'),
                  ),
                  const SizedBox(height: 20),
                  Semantics(
                    liveRegion: true,
                    child: Text(_mensaje, textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
