import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// The app name
  ///
  /// In en, this message translates to:
  /// **'Money App FPT'**
  String get appTitle;

  /// Home label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeLabel;

  /// End date label
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get dueDateLabel;

  /// Start date label
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get startDateLabel;

  /// Category label
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryLabel;

  /// Enter debt amount label
  ///
  /// In en, this message translates to:
  /// **'Enter debt amount'**
  String get enterDebtLabel;

  /// Enter credit amount label
  ///
  /// In en, this message translates to:
  /// **'Enter credit amount'**
  String get enterCreditLabel;

  /// Add Category label
  ///
  /// In en, this message translates to:
  /// **'Add Category'**
  String get addCategoryLabel;

  /// Add Expense label
  ///
  /// In en, this message translates to:
  /// **'Add Expense'**
  String get addExpenseLabel;

  /// Update Expense label
  ///
  /// In en, this message translates to:
  /// **'Update Expense'**
  String get updateExpenseLabel;

  /// Update card label
  ///
  /// In en, this message translates to:
  /// **'Update card'**
  String get updateCardLabel;

  /// Add Account label
  ///
  /// In en, this message translates to:
  /// **'Add Account'**
  String get addAccountLabel;

  /// Categories label
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoriesLabel;

  /// Accounts label
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get accountsLabel;

  /// Budget label
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budgetLabel;

  /// Budget label
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcomeMessage;

  /// Settings label
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsLabel;

  /// Lock app label
  ///
  /// In en, this message translates to:
  /// **'Lock app'**
  String get localAppLabel;

  /// Total label
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalLabel;

  /// Expense label
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get expenseLabel;

  /// Expenses label
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expensesLabel;

  /// Deposit label
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get depositLabel;

  /// Daily label
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get dailyLabel;

  /// Weekly label
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weeklyLabel;

  /// Monthly label
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthlyLabel;

  /// Yearly label
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get yearlyLabel;

  /// All label
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allLabel;

  /// Transaction history label
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get transactionHistoryLabel;

  /// Select category icon label
  ///
  /// In en, this message translates to:
  /// **'Select category icon'**
  String get selectCategoryIconLabel;

  /// Description label
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get descriptionLabel;

  /// Cash label
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cashLabel;

  /// Debit Card label
  ///
  /// In en, this message translates to:
  /// **'Debit Card'**
  String get debitCardLabel;

  /// Credit Card label
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get creditCardLabel;

  /// Cardholder name label
  ///
  /// In en, this message translates to:
  /// **'Cardholder name'**
  String get cardHolderLabel;

  /// Account label
  ///
  /// In en, this message translates to:
  /// **'Account name'**
  String get accountNameLabel;

  /// Last four digit number label
  ///
  /// In en, this message translates to:
  /// **'Last four digit number'**
  String get lastFourDigitLabel;

  /// Add card label
  ///
  /// In en, this message translates to:
  /// **'Add card'**
  String get addCardLabel;

  /// Account added label
  ///
  /// In en, this message translates to:
  /// **'Account added'**
  String get addedCardLabel;

  /// Account updated label
  ///
  /// In en, this message translates to:
  /// **'Account updated'**
  String get updatedCardLabel;

  /// Account deleted label
  ///
  /// In en, this message translates to:
  /// **'Account deleted'**
  String get deletedCardLabel;

  /// Category added successful label
  ///
  /// In en, this message translates to:
  /// **'Category added successful'**
  String get successAddCategoryLabel;

  /// Enter valid name label
  ///
  /// In en, this message translates to:
  /// **'Enter valid name'**
  String get validNameLabel;

  /// Profile label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileLabel;

  /// Theme label
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeLabel;

  /// Reminder label
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get reminderLabel;

  /// Show schedule notifications to add expense label
  ///
  /// In en, this message translates to:
  /// **'Show schedule notifications to add expense'**
  String get reminderDescriptionLabel;

  /// Choose theme label
  ///
  /// In en, this message translates to:
  /// **'Choose theme'**
  String get chooseThemeLabel;

  /// Update label
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateLabel;

  /// User name label
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get userNameLabel;

  /// Select currency label
  ///
  /// In en, this message translates to:
  /// **'Select currency'**
  String get selectedCountryLabel;

  /// Error authentication label
  ///
  /// In en, this message translates to:
  /// **'Error authentication'**
  String get errorAuthLabel;

  /// No cards label
  ///
  /// In en, this message translates to:
  /// **'Empty in cards'**
  String get errorNoCardsLabel;

  /// No cards description label
  ///
  /// In en, this message translates to:
  /// **'Add expenses and will show up here'**
  String get errorNoCardsDescriptionLabel;

  /// No categories label
  ///
  /// In en, this message translates to:
  /// **'Empty in categories'**
  String get errorNoCatagoriesLabel;

  /// No category description label
  ///
  /// In en, this message translates to:
  /// **'Add some categories and will show up here'**
  String get errorNoCategoriesDescriptionLabel;

  /// Empty in budget overview label
  ///
  /// In en, this message translates to:
  /// **'Empty in budget overview'**
  String get errorNoBudgetLabel;

  /// No budget overview description label
  ///
  /// In en, this message translates to:
  /// **'Add some expenses and budget overview will show up here'**
  String get errorNoBudgetDescriptionLabel;

  /// CardHolder label
  ///
  /// In en, this message translates to:
  /// **'CardHolder'**
  String get cardholderLabel;

  /// Expense added label
  ///
  /// In en, this message translates to:
  /// **'Expense added'**
  String get expenseAddedSuccessfulLabel;

  /// Expense updated label
  ///
  /// In en, this message translates to:
  /// **'Expense updated'**
  String get expenseUpdateSuccessfulLabel;

  /// Expense deleted label
  ///
  /// In en, this message translates to:
  /// **'Expense deleted'**
  String get expenseDeletedSuccessfulLabel;

  /// Expense name label
  ///
  /// In en, this message translates to:
  /// **'Expense name'**
  String get expenseNameLabel;

  /// Amount label
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountLabel;

  /// Initial amount label
  ///
  /// In en, this message translates to:
  /// **'Initial amount'**
  String get initialAmountLabel;

  /// Enter valid amount label
  ///
  /// In en, this message translates to:
  /// **'Enter valid amount'**
  String get validAmountLabel;

  /// date label
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateLabel;

  /// Select date label
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get validDateLabel;

  /// add label
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addLabel;

  /// Select account label
  ///
  /// In en, this message translates to:
  /// **'Select account'**
  String get selectAccountLabel;

  /// Select category label
  ///
  /// In en, this message translates to:
  /// **'Select category'**
  String get selectCategoryLabel;

  /// Social links label
  ///
  /// In en, this message translates to:
  /// **'Social links'**
  String get socialLinksLabel;

  /// Telegram label
  ///
  /// In en, this message translates to:
  /// **'Telegram'**
  String get telegramLabel;

  /// A group to follow and post bugs and feature requests label
  ///
  /// In en, this message translates to:
  /// **'A group to follow and post bugs and feature requests'**
  String get telegramGroupLabel;

  /// Budget overview label
  ///
  /// In en, this message translates to:
  /// **'Budget overview'**
  String get budgetOverViewLabel;

  /// No result found label
  ///
  /// In en, this message translates to:
  /// **'No result found'**
  String get noResultFoundLabel;

  /// No category label
  ///
  /// In en, this message translates to:
  /// **'No category selected'**
  String get noCategoryLabel;

  /// No account label
  ///
  /// In en, this message translates to:
  /// **'No account selected'**
  String get noAccountAvailableLabel;

  /// Privacy & Policy label
  ///
  /// In en, this message translates to:
  /// **'Privacy & Policy'**
  String get privacyPolicyLabel;

  /// Github label
  ///
  /// In en, this message translates to:
  /// **'Github'**
  String get githubLabel;

  /// Github label
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get versionLabel;

  /// Version number label
  ///
  /// In en, this message translates to:
  /// **'v{version}'**
  String versionNumber(String version);

  /// Delete account label
  ///
  /// In en, this message translates to:
  /// **'Deleting the account deletes all expenses which tied to this account '**
  String get deleteAccountLabel;

  /// Delete category label
  ///
  /// In en, this message translates to:
  /// **'Deleting the category deletes all expenses which tied to this category '**
  String get deleteCategoryLabel;

  /// Version number label
  ///
  /// In en, this message translates to:
  /// **'Expense will be permanently removed from account'**
  String get deleteExpenseLabel;

  /// Permanently delete label
  ///
  /// In en, this message translates to:
  /// **'Permanently delete?'**
  String get dialogDeleteTitleLabel;

  /// Category updated label
  ///
  /// In en, this message translates to:
  /// **'Category updated'**
  String get updatedCategoryLabel;

  /// Done label
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get doneLabel;

  /// Cancel label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelLabel;

  /// Custom label
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get customLabel;

  /// Accent color label
  ///
  /// In en, this message translates to:
  /// **'Accent color'**
  String get accentColorLabel;

  /// Dynamic label
  ///
  /// In en, this message translates to:
  /// **'Dynamic'**
  String get dynamicColorLabel;

  /// Pick color label
  ///
  /// In en, this message translates to:
  /// **'Pick color'**
  String get pickColorLabel;

  /// Pick color label
  ///
  /// In en, this message translates to:
  /// **'Set color to your category'**
  String get pickColorDescLabel;

  /// Colors label
  ///
  /// In en, this message translates to:
  /// **'Colors'**
  String get colorsLabel;

  /// Others label
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get othersLabel;

  /// GitHub text label
  ///
  /// In en, this message translates to:
  /// **'Fork the project on GitHub'**
  String get githubTextLabel;

  /// Made with ♥ in India label
  ///
  /// In en, this message translates to:
  /// **'Made with ♥ in India'**
  String get madeWithLoveInIndiaLabel;

  /// Made with ♥ in India label
  ///
  /// In en, this message translates to:
  /// **'Update Category'**
  String get updateCategoryLabel;

  /// information label
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get accountInfoLabel;

  /// information label
  ///
  /// In en, this message translates to:
  /// **'The account details you entered are not shared with anyone, including us. It is only used for visual representation of account details, you may enter false info too'**
  String get accountInfoDescLabel;

  /// Next label
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextLabel;

  /// Image label
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get imageLabel;

  /// Welcome label
  ///
  /// In en, this message translates to:
  /// **'Hi, Welcome to'**
  String get welcomeLabel;

  /// Welcome desc label
  ///
  /// In en, this message translates to:
  /// **'What should we call you'**
  String get welcomeDescLabel;

  /// Name label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// Enter name label
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get enterNameLabel;

  /// Image desc label
  ///
  /// In en, this message translates to:
  /// **'Let\'s set image of you'**
  String get imageDescLabel;

  /// Back label
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backLabel;

  /// Set budget label
  ///
  /// In en, this message translates to:
  /// **'Set budget for category'**
  String get setBudgetLabel;

  /// income label
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get incomeLabel;

  /// outcome label
  ///
  /// In en, this message translates to:
  /// **'Outcome'**
  String get outcomeLabel;

  /// This month label
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get thisMonthLabel;

  /// Total balance label
  ///
  /// In en, this message translates to:
  /// **'Total balance'**
  String get totalBalanceLabel;

  /// Summary label
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summaryLabel;

  /// Accept label
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get acceptLabel;

  /// Ok label
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get okLabel;

  /// search message label
  ///
  /// In en, this message translates to:
  /// **'Start searching something!'**
  String get searchMessageLabel;

  /// empty search message label
  ///
  /// In en, this message translates to:
  /// **'Looks like nothing found!'**
  String get emptySearchMessageLabel;

  /// empty search message label
  ///
  /// In en, this message translates to:
  /// **'Add some expenses will show up here'**
  String get emptyExpensesMessage;

  /// Balance label
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balanceLabel;

  /// Balance label
  ///
  /// In en, this message translates to:
  /// **'Select icon'**
  String get selectIconLabel;

  /// Balance label
  ///
  /// In en, this message translates to:
  /// **'Tap to select icon'**
  String get selectIconDescLabel;

  /// income name label
  ///
  /// In en, this message translates to:
  /// **'Income name'**
  String get incomeNameLabel;

  /// Currency sign label
  ///
  /// In en, this message translates to:
  /// **'Currency sign'**
  String get currencySignLabel;

  /// Expense added label
  ///
  /// In en, this message translates to:
  /// **'Income added'**
  String get incomeAddedSuccessfulLabel;

  /// Expense updated label
  ///
  /// In en, this message translates to:
  /// **'Income updated'**
  String get incomeUpdateSuccessfulLabel;

  /// Expense deleted label
  ///
  /// In en, this message translates to:
  /// **'Income deleted'**
  String get incomeDeletedSuccessfulLabel;

  /// Expense by category label
  ///
  /// In en, this message translates to:
  /// **'Expense by category'**
  String get expenseByCategoryLabel;

  /// Backup and Restore label
  ///
  /// In en, this message translates to:
  /// **'Backup and Restore'**
  String get backupAndRestoreLabel;

  /// Backup and restore your data label
  ///
  /// In en, this message translates to:
  /// **'Backup and restore your expense, accounts & categories'**
  String get backupAndRestoreDescLabel;

  /// create label
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get createLabel;

  /// Restore label
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restoreLabel;

  /// Creating backup label
  ///
  /// In en, this message translates to:
  /// **'Creating backup'**
  String get creatingBackupLabel;

  /// Creating backup label
  ///
  /// In en, this message translates to:
  /// **'Restoring backup'**
  String get restoringBackupLabel;

  /// Save as CSV label
  ///
  /// In en, this message translates to:
  /// **'Save as CSV'**
  String get saveAsCSVLabel;

  /// Save as CSV label
  ///
  /// In en, this message translates to:
  /// **'Export data into CSV file format'**
  String get saveAsCSVDescLabel;

  /// Transfer label
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transferLabel;

  /// Rate label
  ///
  /// In en, this message translates to:
  /// **'Rate the app'**
  String get appRateLabel;

  /// Rate label
  ///
  /// In en, this message translates to:
  /// **'Love this app? Let us know in the Google Play Store how we can make it even better'**
  String get appRateDescLabel;

  /// Raise a bug or request label
  ///
  /// In en, this message translates to:
  /// **'Raise a bug or request'**
  String get raiseABugOrRequestLabel;

  /// Found a bug or need a feature to implement ask away label
  ///
  /// In en, this message translates to:
  /// **'Found a bug or need a feature to implement ask away'**
  String get raiseABugOrRequestDescLabel;

  /// Transfer name label
  ///
  /// In en, this message translates to:
  /// **'Transfer name'**
  String get transferNameLabel;

  /// Debts label
  ///
  /// In en, this message translates to:
  /// **'Debts'**
  String get debtsLabel;

  /// Debts label
  ///
  /// In en, this message translates to:
  /// **'Debt'**
  String get debtLabel;

  /// Credit label
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get creditLabel;

  /// Enter category label
  ///
  /// In en, this message translates to:
  /// **'Enter category'**
  String get enterCategoryLabel;

  /// Add debt label
  ///
  /// In en, this message translates to:
  /// **'Add debt'**
  String get addDebtLabel;

  /// Add credit label
  ///
  /// In en, this message translates to:
  /// **'Add credit'**
  String get addCreditLabel;

  /// Enter budget label
  ///
  /// In en, this message translates to:
  /// **'Enter budget'**
  String get enterBudgetLabel;

  /// Enter description label
  ///
  /// In en, this message translates to:
  /// **'Enter description'**
  String get enterDescriptionLabel;

  /// Enter valid description label
  ///
  /// In en, this message translates to:
  /// **'Enter valid description'**
  String get validDescriptionLabel;

  /// Pay debt label
  ///
  /// In en, this message translates to:
  /// **'Pay debt'**
  String get payDebtLabel;

  /// Pay credit label
  ///
  /// In en, this message translates to:
  /// **'Pay credit'**
  String get payCreditLabel;

  /// Enter amount label
  ///
  /// In en, this message translates to:
  /// **'Enter amount'**
  String get enterAmountLabel;

  /// Empty in debts label
  ///
  /// In en, this message translates to:
  /// **'Empty in debts'**
  String get emptyDebtsLabel;

  /// Looks like you have no debts label
  ///
  /// In en, this message translates to:
  /// **'Looks like you have no debts, add them it will show here '**
  String get emptyDebtsDescLabel;

  /// Empty in credits label
  ///
  /// In en, this message translates to:
  /// **'Empty in credits'**
  String get emptyCreditLabel;

  /// Looks like you have no credits label
  ///
  /// In en, this message translates to:
  /// **'Looks like you have no credits, add them it will show here '**
  String get emptyCreditDescLabel;

  /// Enter initial amount label
  ///
  /// In en, this message translates to:
  /// **'Enter initial amount'**
  String get enterInitialAmountLabel;

  /// Optional number
  ///
  /// In en, this message translates to:
  /// **'Enter last 4 digit (optional)'**
  String get enterNumberOptionalLabel;

  /// Enter account name label
  ///
  /// In en, this message translates to:
  /// **'Enter account name'**
  String get enterAccountNameLabel;

  /// Enter account name label
  ///
  /// In en, this message translates to:
  /// **'Enter cardholder name'**
  String get enterCardHolderNameLabel;

  /// Search label
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchLabel;

  /// Add new label
  ///
  /// In en, this message translates to:
  /// **'Add new'**
  String get addNewLabel;

  /// Delete label
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteLabel;

  /// Delete label
  ///
  /// In en, this message translates to:
  /// **'Search expenses, accounts, categories'**
  String get appBarSearchLabel;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
