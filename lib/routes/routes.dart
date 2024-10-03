import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/views/account_deletion_page.dart';
import 'package:ekhoncharge/views/bkash_payment_page.dart';
import 'package:ekhoncharge/views/change_password_page.dart';
import 'package:ekhoncharge/views/direction_google_map_page.dart';
import 'package:ekhoncharge/views/forgot_password_page.dart';
import 'package:ekhoncharge/views/all_sttaion_in_google_map_page.dart';
import 'package:ekhoncharge/views/my_e_charge/gp_offer_page.dart';
import 'package:ekhoncharge/views/my_e_charge/my_send_money_page.dart';
import 'package:ekhoncharge/views/my_e_charge/order_food_page.dart';
import 'package:ekhoncharge/views/otp_verify_forgot_password_page.dart';
import 'package:ekhoncharge/views/phone_num_forgot_password_page.dart';
import 'package:ekhoncharge/views/privacy_policy_page.dart';
import 'package:ekhoncharge/views/slot_booked_details_page.dart';
import 'package:ekhoncharge/views/slot_booking_page.dart';
import 'package:ekhoncharge/views/card_banking-type.dart';
import 'package:ekhoncharge/views/master_card_data_input_page.dart';
import 'package:ekhoncharge/views/mobile_banking_type_page.dart';
import 'package:ekhoncharge/views/charging_faq_page.dart';
import 'package:ekhoncharge/views/charging_page.dart';
import 'package:ekhoncharge/views/contact_us_page.dart';
import 'package:ekhoncharge/views/home.dart';
import 'package:ekhoncharge/views/notification_page.dart';
import 'package:ekhoncharge/views/otp_verify_page.dart';
import 'package:ekhoncharge/views/payment_failure_page.dart';
import 'package:ekhoncharge/views/payment_option_page.dart';
import 'package:ekhoncharge/views/payment_success_page.dart';
import 'package:ekhoncharge/views/premium_offers_page.dart';
import 'package:ekhoncharge/views/profile_information_update_page.dart';
import 'package:ekhoncharge/views/profile_nav_page.dart';
import 'package:ekhoncharge/views/promo_code_page.dart';
import 'package:ekhoncharge/views/select_car_page.dart';
import 'package:ekhoncharge/views/setting_page.dart';
import 'package:ekhoncharge/views/signup_page.dart';
import 'package:ekhoncharge/views/splash_page.dart';
import 'package:ekhoncharge/views/station_details_page.dart';
import 'package:ekhoncharge/views/station_search_page.dart';
import 'package:ekhoncharge/views/successful_message_page.dart';
import 'package:ekhoncharge/views/vehicle_setup_page.dart';
import 'package:ekhoncharge/views/login_page.dart';
import 'package:ekhoncharge/views/view_registered_car_page.dart';
import 'package:ekhoncharge/views/view_slot_page.dart';
import 'package:ekhoncharge/views/wallet_create_page.dart';
import 'package:ekhoncharge/views/wallet_page.dart';
import 'package:ekhoncharge/views/welcome_page.dart';
import 'package:get/get.dart';

import '../views/Add_money_page.dart';
import '../views/my_e_charge/my_offer_page.dart';

class Routes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.loginPage,
          page: () => const LoginPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.home,
          page: () => const Home(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.splashPage,
          page: () => const SplashPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.signupPage,
          page: () => const SignupPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.otpVerifyPage,
          page: () => const OtpVerifyPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.profileSetupPage,
          page: () => const ProfileInformationUpdatePage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.vehicleSetupPage,
          page: () => const VehicleSetupPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.walletPage,
          page: () => const WalletPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.stationSearchPage,
          page: () => const StationSearchPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.stationDetailsPage,
          page: () => const StationDetailsPage(),
          transition: Transition.leftToRightWithFade,
        ),
        // GetPage(
        //   name: RoutesName.paymentPage,
        //   page: () => const PaymentPage(),
        //   transition: Transition.leftToRightWithFade,
        // ),
        // GetPage(
        //   name: RoutesName.paymentGatewayPage,
        //   page: () => const PaymentGatewayPage(),
        //   transition: Transition.leftToRightWithFade,
        // ),
        GetPage(
          name: RoutesName.notificationPage,
          page: () => const NotificationPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.paymentSuccessPage,
          page: () => const PaymentSuccessPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.paymentFailurePage,
          page: () => const PaymentFailurePage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.successfulMessagePage,
          page: () => const SuccessfulMessagePage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.selectCarPage,
          page: () => const SelectCarPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.chargingPage,
          page: () => ChargingPage(),
          transition: Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RoutesName.paymentOptionPage,
          page: () => const PaymentOptionsPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.chargingFaqPage,
          page: () => const ChargingFaqPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.privacyPolicy,
          page: () => const PrivacyPolicy(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.contactUsPage,
          page: () => const ContactUsPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.promoCodePage,
          page: () => const PromoCodePage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.premiumOffersPage,
          page: () => const PremiumOffersPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.welcomePage,
          page: () => const WelcomePage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.addMoneyPage,
          page: () => const AddMoneyPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.mobileBankingTypePage,
          page: () => const MobileBankingTypePage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.cardBankingTypePage,
          page: () => const CardBankingType(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.masterCardDataInputPage,
          page: () => const MasterCardDataInputPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.profileNavPage,
          page: () => const ProfileNavPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.settingPage,
          page: () => const SettingPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.slotBookingPage,
          page: () => const SlotBookingPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.bkashPaymentPage,
          page: () => const BkashPaymentPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.viewSlotPage,
          page: () => const ViewSlotPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.slotBookedPage,
          page: () => const SlotBookedDetailsPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.myOfferPage,
          page: () => const MyOfferPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.gpOfferPage,
          page: () => const GpOfferPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.mySendMoneyPage,
          page: () => const MySendMoneyPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.orderFoodPage,
          page: () => const OrderFoodPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.viewRegisteredCarPage,
          page: () => const RegisteredCarPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.forgotPasswordPage,
          page: () => const ForgotPasswordPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.changePasswordPage,
          page: () => const ChangePasswordPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.phoneNumForgotPasswordPage,
          page: () => const PhoneNumForgotPasswordPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.otpVerifyForgotPasswordPage,
          page: () => const OtpVerifyForgotPasswordPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.allStationInGoogleMapPage,
          page: () => AllStationInGoogleMapPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.directionGoogleMapPage,
          page: () => DirectionGoogleMapPage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.walletCreatePage,
          page: () => WalletCreatePage(),
          transition: Transition.leftToRightWithFade,
        ),
    GetPage(
          name: RoutesName.accountDeletionPage,
          page: () => AccountDeletionPage(),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
