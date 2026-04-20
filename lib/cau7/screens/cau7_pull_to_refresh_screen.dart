import 'package:flutter/material.dart';

import '../controllers/cau7_news_controller.dart';
import '../data/models/cau7_news_model.dart';

class Cau7PullToRefreshScreen extends StatefulWidget {
  const Cau7PullToRefreshScreen({super.key});

  @override
  State<Cau7PullToRefreshScreen> createState() =>
      _Cau7PullToRefreshScreenState();
}

class _Cau7PullToRefreshScreenState extends State<Cau7PullToRefreshScreen> {
  final Cau7NewsController _controller = Cau7NewsController();

  List<Cau7NewsModel> _news = [];
  bool _isInitialLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  Future<void> _loadNews() async {
    try {
      final data = await _controller.getNews();
      if (!mounted) {
        return;
      }

      setState(() {
        _news = data;
        _error = null;
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
          _isInitialLoading = false;
        });
      }
    }
  }

  Future<void> _onRefresh() async {
    await _loadNews();
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('News reloaded')));
  }

  Widget _buildContent() {
    if (_isInitialLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 260,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Error: $_error', textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      );
    }

    if (_news.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          SizedBox(
            height: 260,
            child: Center(child: Text('No news available')),
          ),
        ],
      );
    }

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: _news.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = _news[index];
        return ListTile(
          title: Text(item.title),
          subtitle: Text(
            item.body,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          leading: CircleAvatar(child: Text(item.id.toString())),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cau 7 - Pull to Refresh')),
      body: RefreshIndicator(onRefresh: _onRefresh, child: _buildContent()),
    );
  }
}
