import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageState {
  PageState(this.pageNum);
  final int pageNum;
}

class PageService extends StateNotifier<PageState> {
  PageService(PageState state) : super(state);

  void changePageTo(int value) {
    state = PageState(value);
  }
}
