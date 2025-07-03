import 'package:riverpod/riverpod.dart';

import '../data/repo_news.dart';
import '../model/model.dart';

final newsViewModelProvider = AsyncNotifierProvider<NewsViewModel, NewsModel>(
      () => NewsViewModel(),
);

class NewsViewModel extends AsyncNotifier<NewsModel> {
  @override
  Future<NewsModel> build() async {
    final repo = ref.read(newsRepositoryProvider);
    return await repo.fetchNews();
  }
}