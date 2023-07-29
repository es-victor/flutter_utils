/// App Constants
const String appName = "VGO Discounts";

enum VGOType { Privilege, Pass }

enum OfferDiscountType { offer, discount }

enum QRCodeType { Discount, Offer, Privilege, Pass, All }

class HtmlDocumentType {
  static const termsOfUse = ["term-of-use", "Term of use"];
  static const termAndConditionForBusiness = [
    "term-and-condition-for-business",
    "Terms and Conditions for Business"
  ];
  static const termAndConditionForCustomer = [
    "term-and-condition-for-customer",
    "Terms and Condition for Customer"
  ];
  static const vgoPrivilegePassAgreement = [
    "vgo-privilege-pass-agreement",
    "VGO Privilege/Pass Agreement"
  ];
  static const aboutUs = ["about-us", "About Us"];
  static const faqBusiness = [
    "faq-participating-outlet",
    "FAQ Participating Outlet"
  ];
  static const faqCustomer = ["faq-customer", "FAQ Customer"];
  static const vgoSmart = ["vgo-smart", "VGO Play"];
  static const vgoLearn = ["vgo-learn", "VGO Learn"];
  static const vgoPass = ["vgo-pass", "VGO Pass"];
  static const vgoPrivilege = ["vgo-privilege", "VGO Privilege"];
  static const vgoIntroductionForOutlets = [
    "vgo-introduction-for-outlets",
    "VGO Introduction for Outlets"
  ];
  static const privacyPolicy = ["privacy-policy", "Privacy Policy"];
}

/// Widgets Padding
const double p0 = 2;
const double p1 = 4;
const double p2 = 8;
const double p3 = 12;
const double p4 = 16;
const double p5 = 24;
const double p6 = 32;
const double p7 = 64;
const double p23 = 10;

/// Page content padding
const double pagePadding = 16;

/// Button radius
const double btnRadius = 4;

/// Application cycle constants
const int passcodeLength = 4;
const timeoutDuration = Duration(seconds: 40);
const passwordLengthMin = 8;

enum Sex { Male, Female }

const String NOT_PROVIDED = "NOT PROVIDED";

enum HomePages { home, diary, reports, settings }

/// Date Scroll select
const double selectOptionHeight = 48;
const int datePreviewCount = 5;
const Map<int, String> dobMonth = {
  1: 'Jan',
  2: 'Feb',
  3: 'Mar',
  4: 'Apr',
  5: 'May',
  6: 'Jun',
  7: 'Jul',
  8: 'Aug',
  9: 'Sep',
  10: 'Oct',
  11: 'Nov',
  12: 'Dec'
};
const List<String> weekDayName = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];
const Map<int, String> weekDayNameWithAll = {
  0: 'All',
  1: 'Sun',
  2: 'Mon',
  3: 'Tue',
  4: 'Wed',
  5: 'Thu',
  6: 'Fri',
  7: 'Sat'
};

/// Remove trailing zero
RegExp trailingZero = RegExp(r"([.]*0+)(?!.*\d)");
