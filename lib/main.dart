import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ayuvani/data/repo/chemist_repo/chemist_login_repo.dart';
import 'package:flutter_ayuvani/ui/chemist/chemist_dashboard/chemist_dashboard_screen.dart';
import 'package:flutter_ayuvani/ui/chemist/order_detail.dart';
import 'package:flutter_ayuvani/ui/chemist/signup/bloc/chemist_signup_bloc.dart';
import 'package:flutter_ayuvani/ui/widgets/BottomNavPageView.dart';
import 'package:flutter_ayuvani/utils/AppStore.dart';
import 'package:flutter_ayuvani/utils/SharedPref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './ui/user/login/bloc/user_login_bloc.dart';
import './utils/observer/bloc_observer.dart';
import 'data/repo/chemist_repo/chemist_register_repo.dart';
import 'data/repo/user_repo/user_login.dart';
import 'ui/chemist/login/Login_Screen_Chemist.dart';
import 'ui/chemist/login/bloc/chemist_login_bloc.dart';
import 'ui/chemist/signup/chemist_sign_up_Screen.dart';
import 'ui/user/HomePageScreen.dart';
import 'ui/user/PrescriptionScreen.dart';
import 'ui/user/ProfileHomePageScreen.dart';
import 'ui/user/UserProfile.dart';
import 'ui/user/add_members/add_family_list.dart';
import 'ui/user/add_members/add_family_member_form.dart';
import 'ui/user/add_members/added_edit_sceen_family_form.dart';
import 'ui/user/ask_login/Ask_Login.dart';
import 'ui/user/blog/blog_screen.dart';
import 'ui/user/blog/blogdetails_screen.dart';
import 'ui/user/book_appoitment/Booking_Appointment.dart';
import 'ui/user/buy_medicine/Buy_Medicine.dart';
import 'ui/user/chat_screens/ChatListScreen.dart';
import 'ui/user/chat_screens/MainChatScreen.dart';
import 'ui/user/forget_password/Forget_Password_Patient.dart';
import 'ui/user/forget_password/new_password_field.dart';
import 'ui/user/forget_password/otp_email_forget_password.dart';
import 'ui/user/forget_password/otp_field_forget_password.dart';
import 'ui/user/forget_password/otp_phone_forget_password.dart';
import 'ui/user/login/Login_Screen_Patient.dart';
import 'ui/user/login/login_otp_screen.dart';
import 'ui/user/medical_invoice/MedicineInvoiceDetails.dart';
import 'ui/user/medical_invoice/MedicineInvoiceList.dart';
import 'ui/user/medicine_status/MedicineStatus.dart';
import 'ui/user/medicine_store/medical_store.dart';
import 'ui/user/news_feed/NewsFeedStory.dart';
import 'ui/user/payment/Payment.dart';
import 'ui/user/payment/PaymentCompletedScreen.dart';
import 'ui/user/record_upload/record_upload.dart';
import 'ui/user/regimes_packages/RegimePackageDetails.dart';
import 'ui/user/regimes_packages/Regimes_Doctor_Appointment_Booking.dart';
import 'ui/user/regimes_packages/Regimes_Products_List.dart';
import 'ui/user/reminder_screen.dart';
import 'ui/user/servicewise_screen/ServiceDoctorList.dart';
import 'ui/user/servicewise_screen/ServiceWise.dart';
import 'ui/user/servicewise_screen/ServiceWise_Booking.dart';
import 'ui/user/sign_up/Sign_Up_Screen.dart';
import 'ui/user/textfiled_email_forget_password.dart';
import 'ui/user/textfiled_phone_forget_password.dart';

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();

var getData;
bool ios13 = false;

void main() async {
//region Entry Point
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  Bloc.observer = PractoBlocObserver();
  runApp(MyApp());
//endregion
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String _textFromFile = "";
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  MyAppState() {
    getlogintoken().then((val) {
      setState(() {
        _textFromFile = val;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    var window = WidgetsBinding.instance.window;
    SharedPreferencesTest().saveuserdata("get").then((value) {
      setState(() {});
    });
    if (Platform.isIOS) iOS_Permission();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (chemistSignUpContext) => ChemistResgisterRepo()),
        RepositoryProvider(
            create: (chemistSignUpContext) => ChemistLoginRepo()),
        RepositoryProvider(create: (userLoginContext) => UserLoginApi()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ChemistLoginBloc>(
              create: (authContext) => ChemistLoginBloc(
                  chemistLoginRepo:
                      RepositoryProvider.of<ChemistLoginRepo>(authContext))),
          BlocProvider<ChemistSignupBloc>(
            create: (sinUpContext) => ChemistSignupBloc(
                chemistResgisterRepo:
                    RepositoryProvider.of<ChemistResgisterRepo>(sinUpContext)),
          ),
          BlocProvider<UserLoginBloc>(
            create: (userLoginContext) => UserLoginBloc(
                userLoginApi:
                    RepositoryProvider.of<UserLoginApi>(userLoginContext)),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.pink[100], accentColor: Colors.pink[100]),
          debugShowCheckedModeBanner: false,
          localeResolutionCallback: (locale, supportedLocales) =>
              Locale(appStore.selectedLanguage),
          locale: Locale(appStore.selectedLanguage),
          supportedLocales: [Locale('en', '')],
          home: AskLoginScreen(),
          routes: {
            // '/LoginPage': (context) => LoginScreen(),
            LoginScreenPatient.route: (context) => LoginScreenPatient(),
            '/SignUpPage': (context) => SignUpScreen(),
            // '/HomePage': (context) => HomePage(),

            BookingAppointment.route: (context) => BookingAppointment(),
            '/Payment': (context) => PaymentScreen(),
            RegimesDoctorAppointmentBooking.route: (context) =>
                RegimesDoctorAppointmentBooking(),
            RegimesProductList.route: (context) => RegimesProductList(),
            RegimePackageDetails.route: (context) => RegimePackageDetails(),
            ServiceDoctorList.route: (context) => ServiceDoctorList(),
            ServiceWise.route: (context) => ServiceWise(),
            SeviceWiseBooking.route: (context) => SeviceWiseBooking(),
            BuyMedicine.route: (context) => BuyMedicine(),
            BlogScreen.route: (context) => BlogScreen(),
            BlogDetailsScreen.route: (context) => BlogDetailsScreen(),
            MedicineStatus.route: (context) => MedicineStatus(),
            NewsFeedStory.route: (context) => NewsFeedStory(),
            UserProfile.route: (context) => UserProfile(),
            MedicineInvoiceList.route: (context) => MedicineInvoiceList(),
            MedicineInvoiceDetails.route: (context) => MedicineInvoiceDetails(),
            RecordUpload.route: (context) => RecordUpload(),
            MedicalStore.route: (context) => MedicalStore(),
            AddFamilyList.route: (context) => AddFamilyList(),
            AddFamilyMemberForm.route: (context) => AddFamilyMemberForm(),
            ChatListScreen.route: (context) => ChatListScreen(),
            MainChatScreen.route: (context) => MainChatScreen(),
            PrescriptionScreen.route: (context) => PrescriptionScreen(),
            HomePage.route: (context) => HomePage(),
            BottomNavPageView.route: (context) => BottomNavPageView(),
            ReminderScreen.route: (context) => ReminderScreen(),
            ProfileHomePage.route: (context) => ProfileHomePage(),
            PaymentCompletedScreen.route: (context) => PaymentCompletedScreen(),
            ForgetPasswordPatient.route: (context) => ForgetPasswordPatient(),
            OtpPhoneForgetPassword.route: (context) => OtpPhoneForgetPassword(),
            OtpEmailForgetPassword.route: (context) => OtpEmailForgetPassword(),
            LoginOtpScreen.route: (context) => LoginOtpScreen(),
            OtpLoginFiled.route: (context) => OtpLoginFiled(),
            TextFiledEmailForgetPassword.route: (context) =>
                TextFiledEmailForgetPassword(),
            TextFiledPhoneForgetPassword.route: (context) =>
                TextFiledPhoneForgetPassword(),
            NewPasswordField.route: (context) => NewPasswordField(),
            AddedFamilyEditScreenForm.route: (context) =>
                AddedFamilyEditScreenForm(),

            //chemist
            ChemistLoginScreen.route: (context) => ChemistLoginScreen(),
            ChemistSignUpScreen.route: (context) => ChemistSignUpScreen(),
            ChemistDashboardScreen.route: (context) => ChemistDashboardScreen(),
            OrderDetail.route: (context) => OrderDetail(),
          },
        ),
      ),
    );
  }

  Future<String> getlogintoken() async {
    {
      var login = await SharedPreferencesTest().checkIsLogin("1");
      return login;
    }
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {});
  }
}
