class _MockHomeScrrenSubject extends Mock implements HomeScrrenSubject {
  new MethodChannel('home_scrren_subject with network').setMockMethodCallHandler((call) async {
    if (call.method == 'fetchData') {
      return 'Mocked data';
    }
    return null;
  });
}

BlocListener<HcBloc, HcState>(
  listener: (context, state) {
    HttpBlogListers.progressTracker(context, state = state.loading);
    HttpBlogListers.handleError(context, state = state.error);
  },
  child:BlocBuilder<HomeCollectionBloc, HomeCollectionState>(
  builder: (context, state) {
    return Container();
  },
),
)

