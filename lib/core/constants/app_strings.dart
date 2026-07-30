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
  static String get navTakeAway => _tr('Take Away', 'تيك أوي');
  static String get takeAway => _tr('Take Away', 'تيك أوي');
  static String get navShift => _tr('Shift', 'الشيفت');
  static String get navHistory => _tr('History', 'السجل');
  static String get navActive => _tr('Active', 'الشغالة');
  static String get navTables => _tr('Tables', 'الترابيزات');

  // Filter Chips & Table Actions
  static String get filterAll => _tr('All', 'الكل');
  static String get filterAvailable => _tr('Available', 'فاضية');
  static String get filterOccupied => _tr('Occupied', 'مشغولة');
  static String get tapToOpen => _tr('Tap to Open', 'اضغط للفتح');
  static String get availableStatus => _tr('Available', 'فاضية');
  static String get occupiedStatus => _tr('Occupied', 'مشغولة');

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

  // Auth Strings
  static String get espressoLogic => _tr('ESPRESSO LOGIC', 'إسبريسو لوجيك');
  static String get welcomeBack => _tr('Welcome Back', 'أهلاً بيك تاني');
  static String get accessTerminalSubtitle => _tr('Access your shop management terminal.', 'سجل دخول للتحكم في الكافيه.');
  static String get staffIdOrEmail => _tr('STAFF ID OR EMAIL', 'كود الكابتن أو الإيميل');
  static String get enterYourIdHint => _tr('Enter your ID', 'اكتب الكود بتاعك');
  static String get pinOrPassword => _tr('PIN OR PASSWORD', 'الباسورد أو الرقم السري');
  static String get forgotPassword => _tr('Forgot Password', 'نسيت الباسورد؟');
  static String get rememberThisStation => _tr('Remember this station', 'افتكر المحطة دي');
  static String get signIn => _tr('Sign In', 'تسجيل الدخول');
  static String get needAnAccount => _tr('Need an account?', 'معندكش حساب؟');
  static String get registerNewStaff => _tr('Register New Staff', 'سجل كابتن جديد');
  static String get precisionQualityCraft => _tr('PRECISION • QUALITY • CRAFT', 'دقة • جودة • إتقان');
  static String get joinTheCrew => _tr('Join the Crew', 'انضم للفريق');
  static String get startJourneySubtitle => _tr('Start your journey as a Shop Captain team member.', 'ابتدى رحلتك كعضو في فريق كابتن الكافيه.');
  static String get fullName => _tr('Full Name', 'الاسم بالكامل');
  static String get egJulianVane => _tr('E.g. Julian Vane', 'مثلاً أحمد محمود');
  static String get staffRole => _tr('Staff Role', 'الوظيفة');
  static String get selectYourRole => _tr('Select your role', 'اختار وظيفتك');
  static String get email => _tr('Email', 'الإيميل');
  static String get emailHint => _tr('name@shopcaptain.com', 'name@shopcaptain.com');
  static String get createSecurePin => _tr('Create Secure Pin', 'اكتب رقم سري آمن');
  static String get pinCodeHint => _tr('4 to 6 digit code', 'كود من ٤ لـ ٦ أرقام');
  static String get pinInfoNote => _tr('Use this PIN for quick tablet terminal access.', 'استخدم الكود ده للدخول السريع من التابلت.');
  static String get register => _tr('Register', 'تسجيل حساب');
  static String get alreadyPartOfCrew => _tr('Already part of the crew?', 'عضو بالفعل في الفريق؟');
  static String get backToLogin => _tr('Back to Login', 'ارجع لتسجيل الدخول');


  // Admin Dashboard Strings
  static String get brewMasterAdmin => _tr('BrewMaster Admin', 'لوحة تحكم الأدمن');
  static String get totalSales => _tr('TOTAL SALES', 'إجمالي المبيعات');
  static String get todayVsYesterday => _tr('Today vs Yesterday', 'النهاردة مقارنة بـ إمبارح');
  static String get totalOrdersUpper => _tr('TOTAL ORDERS', 'إجمالي الأوردرات');
  static String get activeTablesUpper => _tr('ACTIVE TABLES', 'الترابيزات الشغالة');
  static String get bestSellers => _tr('Best Sellers', 'الأكثر مبيعاً');
  static String get last24h => _tr('LAST 24H', 'آخر ٢٤ ساعة');
  static String get units => _tr('units', 'قطعة');
  static String get zReports => _tr('Z-Reports (Past Shifts)', 'تقارير الشيفتات (زد ريبورت)');
  static String get eveningShift => _tr('Evening Shift', 'شيفت مسائي');
  static String get morningShiftAdmin => _tr('Morning Shift', 'شيفت صباحي');
  static String get navDash => _tr('Dash', 'اللوحة');
  static String get navSales => _tr('Sales', 'المبيعات');
  static String get navStock => _tr('Stock', 'المخزن');
  static String get navStaff => _tr('Staff', 'الفريق');
  static String get navSetup => _tr('Setup', 'الإعدادات');

  // Admin Menu Setup Strings
  static String get cafeAdmin => _tr('Cafe Admin', 'أدمن الكافيه');
  static String get menuManagement => _tr('Menu Management', 'إدارة المنيو');
  static String get addNewItem => _tr('Add New Item', 'إضافة صنف جديد');
  static String get itemName => _tr('Item Name', 'اسم الصنف');
  static String get pistachioCortadoHint => _tr('e.g. Pistachio Cortado', 'مثلاً بستاشيو كورتادو');
  static String get basePrice => _tr('Base Price', 'السعر الأولي');
  static String get priceHint => _tr('0.00', '٠.٠٠');
  static String get modifiersUpper => _tr('MODIFIERS', 'الإضافات');
  static String get createNew => _tr('+ Create New', '+ إضافة جديد');
  static String get saveItem => _tr('Save Item', 'حفظ الصنف');
  static String get hotDrinks => _tr('Hot Drinks', 'مشروبات سخنة');
  static String get coldDrinks => _tr('Cold Drinks', 'مشروبات باردة');
  static String get bakery => _tr('Bakery', 'المخبوزات');
  static String get teaAndTonics => _tr('Tea & Tonics', 'شاي وتونيك');
  static String get pastries => _tr('Pastries', 'حلويات ومعجنات');
  static String get navMenu => _tr('Menu', 'المنيو');

  // Admin Place Setup (Tables & Zones) Strings
  static String get zonesUpper => _tr('ZONES', 'المناطق');
  static String get indoor => _tr('Indoor', 'داخلي');
  static String get outdoor => _tr('Outdoor', 'خارجي');
  static String get roof => _tr('Roof', 'الروف');
  static String get bulkCreateTables => _tr('Bulk Create Tables', 'إنشاء ترابيزات بالجملة');
  static String get countLabel => _tr('Count', 'العدد');
  static String get generate => _tr('Generate', 'توليد');
  static String get activeFloorPlan => _tr('ACTIVE FLOOR PLAN', 'مخطط الترابيزات الفعال');
  static String get tablesBadge => _tr('Tables', 'تربيزة');
  static String get manualTile => _tr('Manual', 'يدوي');
  static String get navPlace => _tr('Floor Plan', 'المكان');

  // Admin Staff / Team & Audit Log Strings
  static String get employeeDirectory => _tr('Employee Directory', 'دليل الموظفين');
  static String get activeStaffBadge => _tr('Active', 'نشط');
  static String get pin => _tr('PIN', 'الرمز');
  static String get auditLog => _tr('Audit Log', 'سجل العمليات');
  static String get last7Days => _tr('Last 7 Days', 'آخر ٧ أيام');
  static String get allStaff => _tr('All Staff', 'كل الموظفين');
  static String get refundBadge => _tr('Refund', 'استرجاع');
  static String get orderEditBadge => _tr('Order Edit', 'تعديل طلب');
  static String get exportCsv => _tr('Export CSV', 'تصدير CSV');
  static String get addStaff => _tr('Add Staff Member', 'إضافة موظف جديد');
  static String get staffName => _tr('Staff Name', 'اسم الموظف');
  static String get role => _tr('Role', 'الدور');
  static String get staffTab => _tr('Staff', 'الفريق');

  // Admin System Settings Strings
  static String get systemSettings => _tr('System Settings', 'إعدادات النظام');
  static String get invoiceDetailsUpper => _tr('INVOICE DETAILS', 'تفاصيل الفاتورة');
  static String get storeLogo => _tr('Store Logo', 'شعار المحل');
  static String get uploadPngHint => _tr('Upload transparent PNG (max 500kb)', 'رفع PNG شفاف (بحد أقصى ٥٠٠ كيلوبايت)');
  static String get cafeName => _tr('Cafe Name', 'اسم الكافيه');
  static String get welcomeMessageFooter => _tr('Welcome Message (Footer)', 'رسالة أسفل الفاتورة');
  static String get taxAndServiceUpper => _tr('% TAX & SERVICE', 'الضريبة والخدمة %');
  static String get vatPercent => _tr('VAT (%)', 'ضريبة القيمة المضافة (%)');
  static String get serviceChargePercent => _tr('Service Charge (%)', 'نسبة الخدمة (%)');
  static String get networkPrinterSetup => _tr('Network Printer Setup', 'إعدادات طابعة الشبكة');
  static String get printerType => _tr('Printer Type', 'نوع الطابعة');
  static String get cashierReceipts => _tr('Cashier (Receipts)', 'الكاشير (الفواتير)');
  static String get kitchenReceipts => _tr('Kitchen (KDS)', 'المطبخ');
  static String get barReceipts => _tr('Bar / Drinks', 'البار');
  static String get discoverPrinter => _tr('Discover Printer', 'البحث عن طابعة');
  static String get testPrint => _tr('Test Print', 'طباعة تجريبية');
  static String get statusConnected => _tr('Status: Connected', 'الحالة: متصل');
  static String get defaultPrinterIp => _tr('IP: 192.168.1.104', 'آي بي: 192.168.1.104');
  static String get saveChanges => _tr('Save Changes', 'حفظ التغييرات');
  static String get reset => _tr('Reset', 'إعادة ضبط');

  // Setup & Options
  static String get general => _tr('General', 'عام');
  static String get preferences => _tr('Preferences', 'التفضيلات');
  static String get account => _tr('Account', 'الحساب');
  static String get editProfile => _tr('Edit Profile', 'تعديل البروفايل');
  static String get changePassword => _tr('Change Password', 'تغيير كلمة السر');
  static String get menuSetup => _tr('Menu Setup', 'إعداد المنيو');
  static String get tablesAndFloorSetup => _tr('Tables & Floor Setup', 'إعداد المكان والترابيزات');
  static String get printerSetup => _tr('Printer Setup', 'إعداد الطابعة');
  static String get invoiceAndTaxDetails => _tr('Invoice & Tax Details', 'تفاصيل الفاتورة والضريبة');
  static String get logoutStation => _tr('Logout Station', 'تسجيل خروج المحطة');
  static String get systemDefault => _tr('System Default', 'الوضع الافتراضي للنظام');
  static String get lightMode => _tr('Light Mode', 'الوضع الفاتح');
  static String get darkMode => _tr('Dark Mode', 'الوضع الداكن');
  static String get savePrinterSettings => _tr('Save Printer Settings', 'حفظ إعدادات الطابعة');
  static String get saveDetails => _tr('Save Details', 'حفظ التفاصيل');

  // Shift History & Reports
  static String get shiftHistoryTitle => _tr('Shift History & Reports', 'سجل وتقارير الشيفتات');
  static String get selectDateRange => _tr('Date Range', 'الفترة الزمنية');
  static String get selectStaffMember => _tr('Staff Member', 'الموظف');
  static String get downloadPdfReport => _tr('Download Shift Report (PDF)', 'تحميل تقرير الشيفت (PDF)');
  static String get totalShifts => _tr('Total Shifts', 'إجمالي الشيفتات');
  static String get totalHours => _tr('Total Hours', 'إجمالي الساعات');
  static String get salesProcessed => _tr('Sales Processed', 'إجمالي المبيعات');
  static String get ordersCompleted => _tr('Orders Completed', 'الأوردرات المغلقة');
  static String get pdfExportSuccess => _tr('Shift History PDF exported successfully!', 'تم تصدير تقرير الشيفتات PDF بنجاح!');
  static String get today => _tr('Today', 'اليوم');
  static String get thisMonth => _tr('This Month', 'هذا الشهر');
}
