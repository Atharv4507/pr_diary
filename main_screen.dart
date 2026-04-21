BlocBuilder<SubjectBloc, SubjectState>(
  builder: (context, state) {
    return Container();
  },
)
const factory MainScreen.eventName() = _eventName;

BlocConsumer<FcBloc, FcState>(
  listener: (context, state) {
    
    HttpBlogListers.progressTracker(context, state = state.loading);
    HttpBlogListers.handleError(context, state = state.error);
  },
  builder: (context, state) {
    return Container();
  },
)
