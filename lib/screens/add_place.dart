import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlaceScreen> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar lugar'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                    decoration: const InputDecoration(labelText: 'Título'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe um título';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          _formkey.currentState!.reset();
                        },
                        child: const Text('Limpar'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Salvar'),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
