import 'package:airmid_phase2/src/constant/app_export.dart';
import 'package:airmid_phase2/src/utils/hive/hive_keys.dart';
import 'package:airmid_phase2/src/utils/hive/hive_utils.dart';
import 'package:airmid_phase2/src/widget/custom_image_view.dart';
import 'package:airmid_phase2/src/widget/custom_text_form_field.dart';
import 'package:airmid_phase2/src/widget/dropdown_decoration/dopdown_decoration.dart';
import 'package:airmid_phase2/src/widget/primary_button.dart';
import 'package:airmid_phase2/src/widget/scaffold.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import '../../../theme/color_palette.dart';

class PasswordChanged extends StatefulWidget {
  const PasswordChanged({super.key});

  @override
  State<PasswordChanged> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<PasswordChanged> {
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
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
              ),
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
              border: Border.all(color: AppColors.bgColorLight, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15).r,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.asset(Images.suceess)),
                    FxBox.h24,
                    Center(
                      child: Text(
                        "Password changed",
                        style: TextStyle(
                          fontSize: Responsive.isTablet(context)
                              ? 12.sp
                              : 32.0.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: Constant.fontFamily,
                          color: AppColors.headingColor,
                        ),
                      ),
                    ),
                    FxBox.h10,
                    Center(
                      child: Text(
                        "Your password has been changed succesfully",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Responsive.isTablet(context)
                              ? 10.sp
                              : 12.0.sp,
                          color: AppColors.subheadingColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: Constant.fontFamily,
                        ),
                      ),
                    ),
                    FxBox.h24,

                    FxButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      buttonName: "Back to login",
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
