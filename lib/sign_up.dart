import 'package:flutter/material.dart';
import 'package:sign_up/Widgets/custom_button_auth.dart';
import 'package:sign_up/Widgets/custom_text_field.dart';
import 'package:sign_up/shopping_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();
  TextEditingController nameController=TextEditingController();

  bool isShowPassword = true;
  bool isShowConfirmPassword = true;

  showPassword(){
    isShowPassword = isShowPassword == true ? false : true;
    setState(() {});
  }
  showConfirmPassword(){
    isShowConfirmPassword = isShowConfirmPassword == true ? false : true;
    setState(() {});
  }

  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  void animateToShoppingPage() async {
    await animationController.forward(); // Start fade-out animation
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ShoppingScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Success"),
        content: Text("Account created successfully"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              animateToShoppingPage();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ShoppingScreen()),
              // ); // Navigate to shopping screen
            },
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  void validateAndSubmit() {
    if (formKey.currentState!.validate()) {
      showSuccessDialog();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: FadeTransition(
        opacity: fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                CustomTextFormFieldAuth(hintText: "Enter your Full Name",
                  labalText: "Full Name",
                  iconData: Icons.person_outline,
                  mycontroller: nameController,
                  isNunmber: false,
                  valid: (val) {
                    if(val == null||val.isEmpty){
                      return "Full Name is required ";
                    }if (val[0] != val[0].toUpperCase()){
                      return "The First letter must be capitalized";
                    }
                    return null;
                  },
                ),
                CustomTextFormFieldAuth(hintText: "Enter your email",
                    labalText: "Email",
                    iconData: Icons.email_outlined,
                    mycontroller: emailController,
                    isNunmber: false,
                    valid: (val) {
                      if(val == null||val.isEmpty){
                        return "Email is required ";
                      }if (!val.contains("@")){
                        return "Email must contain '@'";
                      }
                      return null;
                    },
                    ),
                CustomTextFormFieldAuth(hintText: "Enter your Password",
                  obscuretext: isShowPassword,
                  onTapIcon: showPassword,
                  labalText: "Password",
                  iconData: isShowPassword?Icons.lock_outline:Icons.lock_open,
                  mycontroller: passController,
                  isNunmber: false,
                  valid: (val) {
                    if(val == null||val.isEmpty){
                      return "Password is required ";
                    }if (val.length<6){
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                CustomTextFormFieldAuth(hintText: "Enter To Confirm Password",
                  obscuretext: isShowConfirmPassword,
                  onTapIcon: showConfirmPassword,
                  labalText: "Confirm Password",
                  iconData: isShowConfirmPassword?Icons.lock_outline:Icons.lock_open,
                  mycontroller: confirmPassController,
                  isNunmber: false,
                  valid: (val) {
                    if(val == null||val.isEmpty){
                      return "Confirm Password is required ";
                    }if (val!= passController.text){
                      return "Password is don't match ";
                    }
                    return null;
                  },
                ),
                CustomButtonAuth(text: "sign Up",
                  onpressed:() {
                  validateAndSubmit();
                  },),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
