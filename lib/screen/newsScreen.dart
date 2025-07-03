import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/control_news.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(newsViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Tesla News')),
      body: newsAsync.when(
        data: (news) => ListView.builder(
          itemCount: news.articles?.length ?? 0,
          itemBuilder: (context, index) {
            final article = news.articles![index];
            return Card(
              child: ListTile(
                leading: article.urlToImage != null
                    ? Image.network(article.urlToImage!, width: 100, height: 200,fit: BoxFit.fitHeight,)
                    : null,
                title: Text(article.title ?? 'No title',style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(article.description ?? 'No description'),
              ),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}