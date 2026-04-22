class ResetScreen {
  static const String routeName = '/reset';

  static const String title = 'Reset Password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: SizedBox(
              height: 1.sh,
              child: const ResetScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
