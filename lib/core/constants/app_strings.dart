import 'package:flutter/material.dart';

abstract class AppStrings {
  static Locale _currentLocale = const Locale('ar');

 

  static void setLocale(Locale locale) {
    _currentLocale = locale;
  }

  static Locale get currentLocale => _currentLocale;
  static bool get isArabic => _currentLocale.languageCode == 'ar';

  static String _tr(String en, String ar) {
    return isArabic ? ar : en;
  }

  // Required Core & App Title Constants
  static String get title => _tr('Coffee Captain', 'كابتن كافيه');
  static String get subtitle => _tr('Morning Shift', 'شيفت الصبح');
  static String get appTitle => _tr('Coffee Captain', 'كابتن كافيه');
  static String get shopCaptain => _tr('SHOP CAPTAIN', 'كابتن المحل');
  static String get artisanalWorkspace => _tr('The Artisanal Workspace', 'مساحة العمل والكافيه');
  static String get morningShift => _tr('Morning Shift', 'شيفت الصبح');
  static String get captainName => _tr('Captain Ahmed M.', 'كابتن أحمد محمد');
  static String get serverName => _tr('Captain Ahmed M.', 'كابتن أحمد محمد');

  // Navigation & Tabs
  static String get tabInside => _tr('Inside', 'جوة');
  static String get tabOutside => _tr('Outside', 'برة');
  static String get insideHall => _tr('Inside Hall', 'الصالة جوة');
  static String get outsidePatio => _tr('Outside Patio', 'التراس برة');
  static String get navHall => _tr('Hall', 'الصالة');
  static String get navOrders => _tr('Orders', 'الأوردرات');
  static String get navNewTable => _tr('New Table', 'تربيزة جديدة');
  static String get navShift => _tr('Shift', 'الشيفت');
  static String get navHistory => _tr('History', 'السجل');
  static String get navActive => _tr('Active', 'الشغالة');
  static String get navTables => _tr('Tables', 'الترابيزات');

  // Units & Currency
  static String get currency => _tr('EGP', 'ج.م');
  static String get currencySymbol => _tr('EGP', 'ج.م');
  static String get minutes => _tr('m', 'د');
  static String get tablePrefix => _tr('T-', 'تربيزة ');
  static String get currentTotal => _tr('CURRENT TOTAL', 'إجمالي الحساب');
  static String get guests => _tr('Guests', 'زبائن');

  // Status & Error Messages
  static String get errorMessage => _tr('Something went wrong. Please try again.', 'حصل مشكلة، حاول تاني بعد اذنك.');
  static String get retry => _tr('Retry', 'حاول تاني');
  static String get noActiveTables => _tr('No active tables right now.', 'مفيش ترابيزات شغالة دلوقتي.');
  static String get failedToLoadActiveTables => _tr('Failed to load active tables.', 'فشل في تحميل الترابيزات الشغالة.');
  static String get availableForSeating => _tr('Available for seating', 'فاضية وجاهزة للزبون');

  // Search & Hints
  static String get searchHint => _tr('Search for table number...', 'ابحث برقم التربيزة...');
  static String get searchItemsHint => _tr('Search items...', 'ابحث في المنيو...');

  // Open Table Screen
  static String get openTable => _tr('Open Table', 'افتح تربيزة');
  static String get openNewTableTitle => _tr('Open New Table', 'فتح تربيزة جديدة');
  static String get proceedToOrder => _tr('Proceed to Order', 'كمل للأوردر');
  static String get availableTablesOnly => _tr('AVAILABLE TABLES ONLY', 'الترابيزات الفاضية بس');
  static String get availableCountSuffix => _tr('Available', 'فاضية');
  static String get noAvailableTablesInArea => _tr('No available tables in', 'مفيش ترابيزات فاضية في');
  static String get allTablesOccupiedNotice => _tr(
        'All tables in this area are currently occupied or reserved.',
        'كل الترابيزات في المكان ده مشغولة أو محجوزة دلوقتي.',
      );
  static String get selectAvailableTableWarning => _tr(
        'Please select an available table.',
        'ياريت تختار تربيزة فاضية الأول.',
      );
  static String get tableOpenedSuccess => _tr('opened!', 'اتفتحت بنجاح!');

  // Order Items & Review Order Bottom Sheet
  static String get totalLabel => _tr('Total:', 'الإجمالي:');
  static String get totalAmountLabel => _tr('Total Amount', 'إجمالي الحساب');
  static String get itemsSelectedLabel => _tr('Items Selected', 'أصناف مختارة');
  static String get confirmOrder => _tr('Confirm Order', 'تأكيد الأوردر');
  static String get reviewOrder => _tr('Review Order', 'مراجعة الأوردر');
  static String get subtotal => _tr('Subtotal', 'المجموع');
  static String get tax14Percent => _tr('Tax (14%)', 'ضريبة (١٤٪)');
  static String get tax8Percent => _tr('Tax (8%)', 'ضريبة (٨٪)');
  static String get confirmAndSubmitOrder => _tr('Confirm & Submit Order', 'تأكيد وإرسال للمطبخ');
  static String get noItemsAdded => _tr('No items added yet.', 'لسة مفيش أصناف اتضافت.');
  static String get itemsSuffix => _tr('ITEMS', 'أصناف');

  // Table Details Screen
  static String get tableStatusUpper => _tr('TABLE STATUS', 'حالة التربيزة');
  static String get activeOrder => _tr('Active Order', 'الأوردر الشغال');
  static String get addItem => _tr('Add Item', 'زود صنف');
  static String get requestCheck => _tr('Request Check', 'اطلب الحساب');
  static String get moveTable => _tr('Move Table', 'انقل التربيزة');
  static String get orderTimeline => _tr('Order Timeline', 'خط سير الأوردر');
  static String get moveTableTitle => _tr('Move Table', 'نقل التربيزة');
  static String get enterNewTableHint => _tr('Enter new table number (e.g. 08)', 'اكتب رقم التربيزة الجديدة (مثلاً ٠٨)');
  static String get cancel => _tr('Cancel', 'إلغاء');
  static String get move => _tr('Move', 'انقل');

  // Checkout Screen
  static String get checkout => _tr('Checkout', 'الحساب والتقفيل');
  static String get statusLabel => _tr('Status', 'الحالة');
  static String get readyForCheckout => _tr('Ready for Checkout', 'جاهزة للحساب');
  static String get paymentMethod => _tr('Payment Method', 'طريقة الدفع');
  static String get cardMethod => _tr('Card', 'كارت بنكي');
  static String get cardSubtitle => _tr('Tap, Chip, or Swipe', 'دفع بالفيزا أو الماستر كارد');
  static String get cashMethod => _tr('Cash', 'كاش');
  static String get cashSubtitle => _tr('Handover currency', 'دفع نقدي في الإيد');
  static String get digitalWalletMethod => _tr('Digital Wallet', 'محفظة إلكترونية');
  static String get digitalWalletSubtitle => _tr('Apple Pay, Google Pay', 'فودافون كاش أو أبل باي');
  static String get addTip => _tr('Add Tip', 'ضيف إكرامية (تيبس)');
  static String get tip15Percent => _tr('15%', '١٥٪');
  static String get tip20Percent => _tr('20%', '٢٠٪');
  static String get tip25Percent => _tr('25%', '٢٥٪');
  static String get tipCustom => _tr('Custom', 'مبلغ تاني');
  static String get customTipLabel => _tr('Enter Custom Tip Amount (EGP)', 'اكتب مبلغ الإكرامية (بالجنيه)');
  static String get customTipHint => _tr('e.g. 15.00', 'مثلاً ١٥');
  static String get tipAmountLabel => _tr('Tip Amount', 'قيمة الإكرامية');
  static String get closeTableAndPrintReceipt => _tr('Close Table & Print Receipt', 'اقفل التربيزة واطبع الفاتورة');
  static String get splitBill => _tr('SPLIT BILL', 'تقسيم الحساب');
  static String get splitBillTriggered => _tr('Split Bill feature triggered.', 'ميزة تقسيم الحساب شغالين عليها.');
  static String get waiter => _tr('Waiter', 'الويتر');

  // Settings & Localization Screen
  static String get settings => _tr('Settings', 'الإعدادات');
  static String get chooseLanguage => _tr('App Language', 'لغة التطبيق');
  static String get arabicMasri => _tr('العربية (مصري) 🇪🇬', 'العربية (مصري) 🇪🇬');
  static String get english => _tr('English 🇬🇧', 'English 🇬🇧');
  static String get themeSettings => _tr('Appearance & Theme', 'مظهر التطبيق');
  static String get appInformation => _tr('App Info & Staff', 'معلومات التطبيق');
  static String get version => _tr('Version 1.0.0', 'الإصدار ١.٠.٠');
  static String get staffProfile => _tr('Staff Profile', 'بروفايل الكابتن');
}
