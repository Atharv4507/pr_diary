import 'package:airmid_phase2/src/constant/app_export.dart';
import 'package:airmid_phase2/src/presentation/auth/forgot_password/otp_screen.dart';
import 'package:airmid_phase2/src/utils/hive/hive_keys.dart';
import 'package:airmid_phase2/src/utils/hive/hive_utils.dart';
import 'package:airmid_phase2/src/widget/app_bar/custom_app_bar.dart';
import 'package:airmid_phase2/src/widget/custom_image_view.dart';
import 'package:airmid_phase2/src/widget/custom_text_form_field.dart';
import 'package:airmid_phase2/src/widget/dropdown_decoration/dopdown_decoration.dart';
import 'package:airmid_phase2/src/widget/primary_button.dart';
import 'package:airmid_phase2/src/widget/scaffold.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import '../../../theme/color_palette.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _forgotPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return MyScaffold(
      appBar: CustomAppBar(
        // centerTitle: true,
        height: 80.sp,
        leading: Padding(
          padding: EdgeInsets.only(left: 18).r,
          child: Container(
            width: 40.sp,
            height: 40.sp,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.6),
              border: Border.all(color: AppColors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.only(left: 0, top: 25),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.chevron_left_outlined,
                color: AppColors.black,
                size: 24.r,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isTablet(context) ? 100 : 15,
        ).r,
        child: Center(
          child: Container(
            width: Responsive.isMobile(context)
                ? screenWidth * 0.9
                : screenWidth * 0.5,
            constraints: BoxConstraints(
              maxWidth: 500,
              maxHeight: Responsive.isMobile(context)
                  ? screenHeight * 0.40
                  : screenHeight * 0.50,
            ),
            margin: EdgeInsets.symmetric(vertical: screenHeight * 0.3),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.6),
              border: Border.all(color: AppColors.white, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15).r,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: Responsive.isTablet(context)
                              ? 12.sp
                              : 32.0.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: Constant.fontFamily,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                    FxBox.h10,
                    Center(
                      child: Text(
                        "Don’t worry! It happens. Please enter the email\n associated with your account.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Responsive.isTablet(context)
                              ? 9.sp
                              : 12.0.sp,
                          color: AppColors.lightblue,
                          fontWeight: FontWeight.w500,
                          fontFamily: Constant.fontFamily,
                        ),
                      ),
                    ),
                    FxBox.h24,
                    CustomTextFormField(
                      controller: _newPasswordController, //
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Enter your email',
                      textInputType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a valid email or phone number";
                        }
                        if (!EmailPasswordRegx.emailPasswordRegex.emailRegExp
                            .hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    FxBox.h24,
                    PrimaryButton(onPressed: () {}, text: 'Sign In'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
