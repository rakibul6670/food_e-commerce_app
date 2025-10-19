import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/controllers/form_validation_controller.dart';
import 'package:food_ecommerce_app/controllers/user_form_provider.dart';
import 'package:food_ecommerce_app/core/constants/assets_images_path.dart';
import 'package:food_ecommerce_app/core/theme/app_colors.dart';
import 'package:food_ecommerce_app/ui/screens/home_screen.dart';
import 'package:food_ecommerce_app/ui/widgets/custom_text_button.dart';
import 'package:food_ecommerce_app/validator/form_vlaidation.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  //-------------------- user form controller ----------------

  late UserFormProvider userController;

  @override
  void initState() {
    //----------- eta dile error dibe becouse root e ami e privider declear kori nai
    // userController = (context).read<UserFormProvider>();
    userController = UserFormProvider();
    super.initState();
  }

  //------------- dispose controller --------
  @override
  void dispose() {
    userController.userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
      //================ Body Section ==================
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //==================== Welcome Image Top Section ===========
              Container(
                height: screenHeight * .60,
                width: screenWidth,
                decoration: BoxDecoration(color: theme.primaryColor),
                child: Stack(
                  children: [
                    //================== basket ================
                    Positioned(
                      top: 131,
                      //left: 0,
                      right: 43,
                      child: Image.asset(
                        AssetsImagesPath.fuirtsDrops2,
                        height: 50,
                        width: 37,
                        //fit: BoxFit.cover,
                      ),
                    ),

                    //================== food basket ================
                    Positioned(
                      top: 155,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        AssetsImagesPath.authFoodBasket,
                        height: 260,
                        width: 310,
                        //fit: BoxFit.cover,
                      ),
                    ),

                    //================== basket =======
                    Positioned(
                      top: 423,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        AssetsImagesPath.authEllipes,
                        height: 12,
                        width: 301,
                        //fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              //================ Bottom Section =========================
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: userController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 56),

                    //---------------- Title --------------
                    Text(
                      "What is your firstname?",
                      style: TextStyle(
                        color: AppColors.textPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 16),

                    //---------------- Name Field  --------------
                    SizedBox(
                      // height: 56,
                      width: screenWidth * .80,
                      child: TextFormField(
                        controller: userController.userNameController,
                        validator: FormValidation.nameValidator,
                        decoration: InputDecoration(hintText: "Jone"),
                      ),
                    ),

                    SizedBox(height: 42),
                    //--------------------------- Lets Gets Button ----------
                    CustomTextButton(
                      width: screenWidth * .80,
                      buttonName: "Start Ordering ",
                      onpressed: () {
                        if (userController.userNameValidate()) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (predicate) => false,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
