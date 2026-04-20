import 'dart:async';

import 'package:flutter/material.dart';

import '../controllers/cau6_product_controller.dart';
import '../data/models/cau6_product_model.dart';

class Cau6SearchProductScreen extends StatefulWidget {
  const Cau6SearchProductScreen({super.key});

  @override
  State<Cau6SearchProductScreen> createState() =>
      _Cau6SearchProductScreenState();
}

class _Cau6SearchProductScreenState extends State<Cau6SearchProductScreen> {
  final Cau6ProductController _controller = Cau6ProductController();
  final TextEditingController _searchController = TextEditingController();

  List<Cau6ProductModel> _products = [];
  bool _isLoading = false;
  String? _error;
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onKeywordChanged(String value) {
    setState(() {});
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      _search(value.trim());
    });
  }

  Future<void> _search(String keyword) async {
    if (keyword.isEmpty) {
      setState(() {
        _products = [];
        _error = null;
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final products = await _controller.searchProducts(keyword);
      if (!mounted) {
        return;
      }

      setState(() {
        _products = products;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _error = error.toString();
      });
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
      appBar: AppBar(title: const Text('Cau 6 - Search API')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: _onKeywordChanged,
              onSubmitted: (value) => _search(value.trim()),
              decoration: InputDecoration(
                labelText: 'Search product keyword',
                hintText: 'Ex: phone',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          _searchController.clear();
                          _search('');
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : null,
              ),
            ),
          ),
          if (_isLoading) const LinearProgressIndicator(),
          Expanded(
            child: _error != null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Error: $_error',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : _searchController.text.trim().isEmpty
                ? const Center(child: Text('Enter keyword to search products'))
                : _products.isEmpty
                ? const Center(child: Text('No products found'))
                : ListView.separated(
                    itemCount: _products.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final product = _products[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade100,
                          child: Text(product.id.toString()),
                        ),
                        title: Text(product.title),
                        subtitle: Text(
                          '${product.brand} • \$${product.price.toStringAsFixed(2)}',
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
