import 'dart:io';

import 'package:airmid_phase2/src/constant/app_export.dart';
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

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<OtpScreen> {
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
                    FxBox.h24,
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
                        "We’ve sent a code to helloworld@gmail.com.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Responsive.isTablet(context)
                              ? 10.sp
                              : 12.0.sp,
                          color: AppColors.lightblue,
                          fontWeight: FontWeight.w500,
                          fontFamily: Constant.fontFamily,
                        ),
                      ),
                    ),
                    FxBox.h24,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                      child: Pinput(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        controller: _otpController,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        closeKeyboardWhenCompleted: true,
                        length: 4,
                        keyboardType: TextInputType.number,
                        errorPinTheme: PinTheme(
                          height: 60.0.h,
                          width: 60.0.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            // color: AppColors.darkFillColor,
                            border: Border.all(color: AppColors.red),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ConstString.enterOtp;
                          }
                          return null;
                        },
                        defaultPinTheme: PinTheme(
                          height: 60.0.h,
                          width: 60.0.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.white,
                            border: Border.all(color: AppColors.grayborder),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          height: 60.0.h,
                          width: 60.0.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: AppColors.darkslategray),
                          ),
                        ),
                      ),
                    ),
                    FxBox.h24,
                    PrimaryButton(text: "text", onPressed: (){})
                    FxBox.h24,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Send code again : ",
                          style: TextStyle(
                            color: AppColors.deepTeal,
                            fontWeight: FontWeight.w600,
                            fontFamily: Constant.fontFamily,
                            fontSize: Responsive.isTablet(context)
                                ? 7.sp
                                : 12.sp,
                          ),
                        ),
                        Text(
                          "0:20",
                          style: TextStyle(
                            fontSize: Responsive.isTablet(context)
                                ? 7.sp
                                : 12.sp,
                            color: AppColors.subheadingColor,
                          ),
                        ),
                      ],
                    ),
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

class MandatoryField extends StatelessWidget {
  const MandatoryField({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "*",
      style: TextStyle(
        color: AppColors.red,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
