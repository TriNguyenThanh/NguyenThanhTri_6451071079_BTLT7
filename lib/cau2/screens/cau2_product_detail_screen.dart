import 'package:flutter/material.dart';

import '../controllers/cau2_product_controller.dart';
import '../data/models/cau2_product_model.dart';

class Cau2ProductDetailScreen extends StatefulWidget {
  const Cau2ProductDetailScreen({super.key});

  @override
  State<Cau2ProductDetailScreen> createState() =>
      _Cau2ProductDetailScreenState();
}

class _Cau2ProductDetailScreenState extends State<Cau2ProductDetailScreen> {
  final Cau2ProductController _controller = Cau2ProductController();
  late Future<Cau2ProductModel> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = _controller.getProductDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cau 2 - Product Detail')),
      body: FutureBuilder<Cau2ProductModel>(
        future: _productFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Error: ${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final product = snapshot.data;
          if (product == null) {
            return const Center(child: Text('Product not found'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.green[700],
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  product.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
