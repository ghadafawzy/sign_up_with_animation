# sign_up

A new Flutter project for how to build a sign up page with form validation
and navigate to shopping page with smooth animations such as fade-in/out 
animations for seamless transitions between pages

## the following features:

- Input Fields: Full Name, Email, Password, Confirm Password
- Validation Rules:
1- Full Name :the first letter must be capitalized
2- Email: must contain @
3- Password: At least 6 characters long
4- Confirm Password: must match the password
- A success dialog appears when all fields are valid
- After successful sign-up, the app navigates to a shopping screen
- Animation:  After successful sign-up, the SignUp page fades out, 
and shopping page fades in using smooth animation

# Features 
- Responsive UI: The form is build using Flutter's Form and TextForm Filed widgets,
ensuring a clean and responsive user interface.
- Success Dialog: A confirmation dialog with navigation to the next screen 
- Animation Transition: on closing successful dialog, the SignUp page fades out,
  and shopping page fades in using smooth animation

## How to Run the Application
- clone the repository on github
- install dependencies
- run the application

## Structure
- main.dart: Main entry point of the app.
- lib: dived into Widgets and screens
- There is two custom widgets such as Custom_text_field and Custom_button
-  There is two pages such as sign_up page and shopping page

