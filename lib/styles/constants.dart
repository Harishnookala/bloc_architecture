import 'package:intl/intl.dart';

const String welcome_message = "WELCOME TO MUMS & MIDWIVES A place where expected Māmā/Mothers can "
    "easily connect and reach out to local Midwives within their Iwi/communities."
    "At Mums & Midwives you will find that the midwives available are ready to build a "
    "partnership and care for yourself and whānāu.";

const String welcome_message1 = "The foundation of these relationships will be built on collaboration, "
    "which includes trust, honesty, respect and empowering you to make the "
    "best decisions for yourself, pēpi/baby and whānāu/family.";

final indianRupeesFormat = NumberFormat.currency(
  name: "INR",
  locale: 'en_IN',
  decimalDigits: 0, // change it to get decimal places
  symbol: '₹ ',
);