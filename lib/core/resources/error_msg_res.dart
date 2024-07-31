class ErrorMsgRes {
  ErrorMsgRes._init();

  static const kNoInternet = 'Please check your network connectivity';
  static const kUserIdRequired = 'sign-in_idreq';
  static const kPasswordRequired = 'sign-in_passreq';

  static const kNewPasswordRequired = 'set-password_setpass';
  static const kPasswordInvalid = 'sign_up_password_invalid';
  static const kConfirmPasswordRequired = 'set-password_confirmpass';
  static const kPasswordShouldChar =
      'Password should at lease one special character';
  static const kPassword8Char = 'set-password_passmin';
  static const kPasswordNotMatch = 'set-password_passmatch';

  static const kEmaiIdRequired = 'common_emailreq';
  static const kMobileNoRequired = 'common_mobreq';
  static const kInvalidMobileNo = 'common_mobvalid';
  static const kInvalidEmialId = 'common_emailvalid';

  static const kOtpRequired = 'otp_required';
  static const kOtpInvalid = 'otp_invalid';

  static const kNoMessageFound = 'No message found from server';
  static const kServerError = 'common_server_error';

  static const kNidNumberRequired = 'nid_number_required';
  static const kNationalityRequired = 'nationality_required';
  static const kInvalidNidTen = "Invalid NID Ten";
  static const kInvalidNidThirteen = "Invalid NID Thirteen";
  static const kInvalidNidSeventeen= "Invalid NID Seventeen";
  static const kIdentificationTypeRequired= "identification_type_required";
  static const kBirthRegNoRequired = "birth_reg_no_required";
  


  //----------------------//

  static const kNameRequired = 'name_required';
  static const kNameBnRequired = 'name_bn_required';
  static const kFatherNameRequired = 'father_name_required';
  static const kMotherNameRequired = 'mother_name_required';

  static const kAddressRequired = 'address_required';
  static const kAddressBnRequired = 'address_bn_required';
  static const kApplicantPhotoRequired = 'applicant_photo_required';
  static const kNidFrontPhotoRequired = 'nid_front_photo_required';
  static const kNidBackPhotoRequired = 'nid_back_photo_required';
  static const kPassportPhotoRequired = 'passport_photo_required';
  static const kDrivingLicensePhotoRequired = 'driving_license_photo_required';
  static const kPassportNumberRequired = 'passport_number_required';
  static const kBirthPhotoRequired = 'birth_photo_required';
  static const kOthersDocumentPhotoRequired = 'other_document_photo_required';
  static const kResidenceDivision = 'residence_division_required';
  static const kPermanentDivision = 'permanent_division_required';
  static const kDistrictRequired = 'district_required';
  static const kThanaRequired = 'thana_required';
  static const kResAddressLineOneRequired = 'res_address_line_one_required';
  static const kPerAddressLineOneRequired = 'per_address_line_one_required';
  static const kGeneralSavingInstallmentRequired = 'general_saving_installment_required';
  static const kMicroEnNameRequired = 'micro_en_name_required';
  static const kMicroLegalFormRequired = 'micro_legal_form_required';
  static const kOfficeRequired = 'office_required';
  static const kSamityRequired = 'samity_required';
  static const kGenderRequired = 'gender_required';
  static const kDrivingLicenseNumberRequired = 'driving_license_number_required';
  static const kOtherDocumentNameRequired = 'other_document_name_required';
  static const kOtherDocumentNoRequired = 'other_document_no_required';
  static const kBirthDateRequired = 'birth_date_required';


  //.......................... loan application...........................//

  static const kMfiIdRequired = 'mfi_id_required';
  static const kEconomicSectorRequired = 'economic_sector_required';
  static const kEconomicActivityRequired = 'economic_activity_required';
  static const kGraceDaysRequired = 'grace_days_required';
  static const kLendingCategoryRequired = 'lending_category_required';
  static const kLendingApplicationOfficeRequired = 'office_required';
  static const kLendingApplicationSamityRequired = 'samity_required';
  static const kPaymentMethodRequired = 'payment_method_required';
  static const kLoanTermRequired = 'loan_term_required';
  static const kLoanPurposeRequired = 'loan_purpose_required';
  static const kNoOfInstallmentRequired = 'no_of_installment_required';
  static const kInstallmentAmountRequired = 'installment_amount_required';
  static const kAppliedLoanAmountRequired = 'applied_loan_amount_required';
  static const kRepaymentFrequencyRequired = 'repayment_frequency_required';
  static const kWithdrawAmountRequired = 'withdraw_amount_required';
  static const kContactNumberRequired = 'contact_number_required';
  static const kRelationshipRequired = 'relationship_required';


  //..............................end.............................//



//.................error message for loan application.........//
  static const kLoanApplicationIdRequired = 'loan_application_id_required';


//................. end.............................//

//............saving account application error handeling.......//

  static const kMemberRequired = 'member_required';
  static const kProductRequired = 'product_required';
  static const kModeOfPaymentRequired = 'mode_of_payment_required';
  static const kSavingCycleRequired = 'saving_cycle_required';
  static const kSavingCodeRequired = 'saving_code_required';
  static const kDepositTypeRequired = 'deposit_type_required';
  static const kInterestRateRequired = 'interest_rate_required';
  static const kSavingsProductRequired = 'savings_product_required';
  static const kSavingsStatusRequired = 'savings_status_required';
  static const kSavingsStartDateRequired = 'start_date_required';
  static const kSavingsDepositAmount = 'deposit_amount_required';
  static const kMfiProgramRequired = 'mfi_program_required';
  static const kAmountRequired = "amount_required";
//..............end.................//

//................... http response status code error message.....................//

  static const kNoContent = 'no_content';
  static const kBadRequest = 'bad_request';
  static const kUnauthorized = 'unauthorized';
  static const kNotFound = 'not_found';
  static const kRequestTimeOut = 'request_time_out';
  static const kTooManyRequest = 'too_many_request';
  static const kServiceUnavailable = 'service_unavailable';
  static const kAccountIsRequired = 'account_is_required';
  static const kExpectedDisburseDateRequired = 'expected_disburse_date_required';

//............................... end ........................................//




}
