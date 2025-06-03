import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../feature/feature.dart';

class RouteHelper {
  static const String splashScreen = "/splash_screen";
  static const String onboardScreen = '/onboard_screen';
  static const String authScreen = "/auth_screen";
  static const String dashboardScreen = "/dashboard_screen";
  static const String loginNavbar = '/login_navbar';
  static const String nologNavbar = '/no_login_navbar';
  static const String filterScreen = '/filter_screen';
  static const String cartScreen = "/cart_screen";
  static const String checkoutScreen = "/checkout_screen";
  static const String paymentScreen = "/payment_method";
  static const String paybyABA = "/pay_by_aba";
  static const String productDetails = "/product_detail";
  static const String verifyScreen = "/verify_otp_screen";

  static const String customerScreen = "/customer_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String addCustomerScreen = "/add_customer_screen";
  static const String updateCustomerScreen = "/update_customer_screen";
  static const String addContactScreen = "/add_contact_screen";
  static const String projectDetailsScreen = "/project_details_screen";
  static const String addProjectScreen = "/add_project_screen";
  static const String updateProjectScreen = "/update_project_screen";
  static const String taskDetailsScreen = "/task_details_screen";
  static const String addTaskScreen = "/add_task_screen";
  static const String updateTaskScreen = "/update_task_screen";
  static const String invoiceScreen = "/invoice_screen";
  static const String invoiceDetailsScreen = "/invoice_details_screen";
  static const String addInvoiceScreen = "/add_invoice_screen";
  static const String updateInvoiceScreen = "/update_invoice_screen";
  static const String contractScreen = "/contract_screen";
  static const String contractDetailsScreen = "/contract_details_screen";
  static const String addContractScreen = "/add_contract_screen";
  static const String updateContractScreen = "/update_contract_screen";
  static const String ticketScreen = "/ticket_screen";
  static const String ticketDetailsScreen = "/ticket_details_screen";
  static const String addTicketScreen = "/add_ticket_screen";
  static const String updateTicketScreen = "/update_ticket_screen";
  static const String leadScreen = "/lead_screen";
  static const String leadDetailsScreen = "/lead_details_screen";
  static const String addLeadScreen = "/add_lead_screen";
  static const String updateLeadScreen = "/update_lead_screen";
  static const String estimateScreen = "/estimate_screen";
  static const String estimateDetailsScreen = "/estimate_details_screen";
  static const String addEstimateScreen = "/add_estimate_screen";
  static const String updateEstimateScreen = "/update_estimate_screen";
  static const String proposalScreen = "/proposal_screen";
  static const String addProposalScreen = "/add_proposal_screen";
  static const String updateProposalScreen = "/update_proposal_screen";
  static const String itemScreen = "/item_screen";
  static const String itemDetailsScreen = "/item_details_screen";
  static const String settingsScreen = "/settings_screen";
  static const String profileScreen = "/profile_screen";
  static const String privacyScreen = "/privacy_screen";

  List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.downToUp,
      curve: Curves.fastEaseInToSlowEaseOut,
    ),
    //   GetPage(name: onboardScreen, page: () => const OnBoardIntroScreen()),

    GetPage(
      name: authScreen,
      page: () => const AuthScreen(),
    ),
    GetPage(
      name: dashboardScreen,
      page: () => const DashboardScreen(),
      transition: Transition.downToUp,
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(name: loginNavbar, page: () => LoginNavbar()),
    GetPage(name: nologNavbar, page: () => NoLoginNavbar()),
    GetPage(
      name: filterScreen,
      page: () => FilterScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: cartScreen,
      page: () => const CartScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: checkoutScreen,
      page: () => const CheckoutScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(name: paymentScreen, page: () => const PaymentMethod()),
    GetPage(name: paybyABA, page: () => PayByABA()),
    GetPage(
      name: productDetails,
      page: () => ProductDetail(),
    ),
    GetPage(name: verifyScreen, page: () => const VerifyOtpScreen()),

    //   GetPage(
    //       name: forgotPasswordScreen, page: () => const ForgetPasswordScreen()),
    //   GetPage(name: customerScreen, page: () => const CustomersScreen()),
    //   GetPage(
    //       name: customerDetailsScreen,
    //       page: () => CustomerDetailsScreen(id: Get.arguments)),
    //   GetPage(name: addCustomerScreen, page: () => const AddCustomerScreen()),
    //   GetPage(
    //       name: addContactScreen,
    //       page: () => AddContactScreen(id: Get.arguments)),
    //   GetPage(
    //       name: updateCustomerScreen,
    //       page: () => UpdateCustomerScreen(id: Get.arguments)),
    //   GetPage(
    //       name: projectDetailsScreen,
    //       page: () => ProjectDetailsScreen(id: Get.arguments)),
    //   GetPage(name: addProjectScreen, page: () => const AddProjectScreen()),
    //   GetPage(
    //       name: updateProjectScreen,
    //       page: () => UpdateProjectScreen(id: Get.arguments)),
    //   GetPage(
    //       name: taskDetailsScreen,
    //       page: () => TaskDetailsScreen(id: Get.arguments)),
    //   GetPage(name: addTaskScreen, page: () => const AddTaskScreen()),
    //   GetPage(
    //       name: updateTaskScreen,
    //       page: () => UpdateTaskScreen(id: Get.arguments)),
    //   GetPage(name: invoiceScreen, page: () => const InvoicesScreen()),
    //   GetPage(
    //       name: invoiceDetailsScreen,
    //       page: () => InvoiceDetailsScreen(id: Get.arguments)),
    //   GetPage(name: addInvoiceScreen, page: () => const AddInvoiceScreen()),
    //   GetPage(
    //       name: updateInvoiceScreen,
    //       page: () => UpdateInvoiceScreen(id: Get.arguments)),
    //   GetPage(name: contractScreen, page: () => const ContractsScreen()),
    //   GetPage(
    //       name: contractDetailsScreen,
    //       page: () => ContractDetailsScreen(id: Get.arguments)),
    //   GetPage(name: addContractScreen, page: () => const AddContractScreen()),
    //   GetPage(
    //       name: updateContractScreen,
    //       page: () => UpdateContractScreen(id: Get.arguments)),
    //   GetPage(name: ticketScreen, page: () => const TicketsScreen()),
    //   GetPage(
    //       name: ticketDetailsScreen,
    //       page: () => TicketDetailsScreen(id: Get.arguments)),
    //   GetPage(name: addTicketScreen, page: () => const AddTicketScreen()),
    //   GetPage(
    //       name: updateTicketScreen,
    //       page: () => UpdateTicketScreen(id: Get.arguments)),
    //   GetPage(name: leadScreen, page: () => const LeadScreen()),
    //   GetPage(
    //       name: leadDetailsScreen,
    //       page: () => LeadDetailsScreen(id: Get.arguments)),
    //   GetPage(name: addLeadScreen, page: () => const AddLeadScreen()),
    //   GetPage(
    //       name: updateLeadScreen,
    //       page: () => UpdateLeadScreen(id: Get.arguments)),
    //   GetPage(name: estimateScreen, page: () => const EstimateScreen()),
    //   GetPage(
    //       name: estimateDetailsScreen,
    //       page: () => EstimateDetailsScreen(id: Get.arguments)),
    //   GetPage(name: addEstimateScreen, page: () => const AddEstimateScreen()),
    //   GetPage(
    //       name: updateEstimateScreen,
    //       page: () => UpdateEstimateScreen(id: Get.arguments)),
    //   GetPage(name: proposalScreen, page: () => const ProposalScreen()),
    //   GetPage(name: addProposalScreen, page: () => const AddProposalScreen()),
    //   GetPage(
    //       name: updateProposalScreen,
    //       page: () => UpdateProposalScreen(id: Get.arguments)),
    //   GetPage(name: itemScreen, page: () => const ItemScreen()),
    //   GetPage(
    //       name: itemDetailsScreen,
    //       page: () => ItemDetailsScreen(id: Get.arguments)),
    //   GetPage(name: profileScreen, page: () => const ProfileScreen()),
    //   GetPage(name: settingsScreen, page: () => const MenuScreen()),
    //   GetPage(name: privacyScreen, page: () => const PrivacyPolicyScreen()),
  ];
}
