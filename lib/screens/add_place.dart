import 'dart:io';

import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }

    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredTitle, _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.only(
                top: 10,
                left: 12,
                right: 12,
                bottom: 0,
              ),
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      color: Colors.deepPurple,
                    ),
                    hintText: "Title"),
              ),
            ),
            const SizedBox(height: 10),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text('Add Place'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
