import 'package:flutter/material.dart';
import 'dart:convert';

import '../controllers/cau3_post_controller.dart';

class Cau3CreatePostScreen extends StatefulWidget {
  const Cau3CreatePostScreen({super.key});

  @override
  State<Cau3CreatePostScreen> createState() => _Cau3CreatePostScreenState();
}

class _Cau3CreatePostScreenState extends State<Cau3CreatePostScreen> {
  final Cau3PostController _controller = Cau3PostController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  bool _isLoading = false;
  String _responseText = '';

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _submitPost() async {
    final title = _titleController.text.trim();
    final body = _contentController.text.trim();

    if (title.isEmpty || body.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter title and body')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _controller.createPost(title: title, body: body);

      debugPrint('Create post response: $response');

      if (!mounted) {
        return;
      }

      setState(() {
        _responseText = jsonEncode(response.toJson());
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post created successfully')),
      );
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $error')));
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cau 3 - Create Post')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _contentController,
              minLines: 4,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _submitPost,
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Create Post'),
            ),
            const SizedBox(height: 20),
            if (_responseText.isNotEmpty) ...[
              const Text(
                'Response from server:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SelectableText(_responseText),
            ],
          ],
        ),
      ),
    );
  }
}
