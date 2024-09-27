import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlaceScreen> {
  final _formkey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  void _saveItem() {
    final enteredText = _titleController.text;

    if (enteredText.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Erro ao adicionar lugar'),
            content: const Text('Informe um título'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Fechar',
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ],
          );
        },
      );
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(enteredText);

    Navigator.of(context).pop();
  }

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
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
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
                  const ImageInput(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          _formkey.currentState!.reset();
                        },
                        child: const Text('Limpar'),
                      ),
                      ElevatedButton.icon(
                        onPressed: _saveItem,
                        icon: const Icon(Icons.add),
                        label: const Text('Adicionar lugar'),
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
