import 'package:ekhoncharge/api/config.dart';

class APIs {
  static const String liveBaseURL = '';
  static const String devBaseURL = ' ';
  static const String liveImageUrl = ' ';
  static const String devImageUrl = ' ';

  static const String liveBkashBaseUrl =
      ' ';
  static const String devBkashBaseURL =
      ' ';

  static String loginAPI = '${APIConfig.baseURL}/login';
  static String refreshToken = '${APIConfig.baseURL}/refresh-token';
  static String registrationAPI = '${APIConfig.baseURL}/user/register';
  static String otpGenerateAPI = '${APIConfig.baseURL}/generate/otp';
  static String otpVerifyAPI = '${APIConfig.baseURL}/verify/otp';
  static String chargeBoxAPI = '${APIConfig.baseURL}/charge-box';
  static String vehicleMakeAPI = '${APIConfig.baseURL}/get/vehicle/makes';
  static String vehicleModelAPI = '${APIConfig.baseURL}/get/vehicle/models';
  static String vehicleYearAPI = '${APIConfig.baseURL}/get/vehicle/years';
  static String vehicleStoreAPI = '${APIConfig.baseURL}/customer-vehicles';
  static String vehiclesListAPI = '${APIConfig.baseURL}/get/customer-vehicles';
  static String vehicleDetailsAPI = '${APIConfig.baseURL}/get/vehicle';
  static String stationAPI = '${APIConfig.baseURL}/stations';
  static String profileUpdateAPI = '${APIConfig.baseURL}/profile-update';
  static String transactionHistoryAPI = '${APIConfig.baseURL}/energytxns';
  static String customerTransactionHistoryAPI =
      '${APIConfig.baseURL}/customer-energytxns';
  static String bookedTimeslots =
      'https://dev.sentineltechno.com/booked_timeslots';
  static String chargerPointsAPI = '${APIConfig.baseURL}/chargerpoints';
  static String profilePhotoUploadAPI = '${APIConfig.baseURL}/customer/image';
  static String professionDataListAPI = '${APIConfig.baseURL}/professions';
  static String connectStartBtnAPI =
      '${APIConfig.baseURL}/remote-start-transaction';
  static String connectStopBtnAPI =
      '${APIConfig.baseURL}/remote-stop-transaction';
  static String bookingSlotAPI = '${APIConfig.baseURL}/booking/timeslots/store';
  static String bookedSlotDetailsAPI =
      '${APIConfig.baseURL}/customer/booking/slots';
  static String privacyPoliciesAPI =
      '${APIConfig.baseURL}/privacy-policies';
  static String faqAPI = '${APIConfig.baseURL}/faq';
  static String contactAPI = '${APIConfig.baseURL}/contact';
  static String stopEnergyTxnAPI = '${APIConfig.baseURL}/energy-transaction';
  static String paymentWalletAPI = '${APIConfig.baseURL}/wallet/payment';
  static String bkashWalletDepositAPI = '${APIConfig.baseURL}/wallet/recharge';

  static String walletTransactionAPI = '${APIConfig.baseURL}/customer/wallet';

  static String pusherAuth = '${APIConfig.baseURL}/broadcasting/auth';
  static String createBkashPayment =
      '${APIConfig.bKashBaseURL}/tokenized/checkout/create';
  static String bkashCheckoutExecute =
      '${APIConfig.bKashBaseURL}/tokenized/checkout/execute';
  static String requestForBkashToken =
      '${APIConfig.bKashBaseURL}/tokenized/checkout/token/grant';
  static String refreshBkashToken =
      '${APIConfig.bKashBaseURL}/tokenized/checkout/token/refresh';

  static String devBkashUsername = "sandboxTokenizedUser02";
  static String devBkashPassword = "sandboxTokenizedUser02@12345";
  static String devBkashAppKey = "4f6o0cjiki2rfm34kfdadl1eqq";
  static String devBkashAppSecret =
      "2is7hdktrekvrbljjh44ll3d9l1dtjo4pasmjvs5vl5qr3fug4b";

  static String liveBkashUsername = "0190 ";
  static String liveBkashPassword = "[2Y ";
  static String liveBkashAppKey = " ";
  static String liveBkashAppSecret =
      " ";

  static String changePasswordAPI = '${APIConfig.baseURL}/user/change-password';
  static String userForgotPassByPhoneNumberAPI =
      '${APIConfig.baseURL}/user/forget-password/resend-otp';

  static String userForgotPassOtpVerifyAPI =
      '${APIConfig.baseURL}/user/forget-password/confirm-otp';

  static String changeForgotPasswordAPI =
      '${APIConfig.baseURL}/user/change-forgot-password';
  static String walletCreateAPI = '${APIConfig.baseURL}/wallet-create';
  static String accountDeleteAPI = '${APIConfig.baseURL}/user/delete-account';
}
