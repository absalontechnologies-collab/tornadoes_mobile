import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'theme/app_theme.dart';
import 'features/root/presentation/root_screen.dart';

import 'features/auth/presentation/splash_screen.dart';
import 'features/auth/presentation/phone_login_screen.dart';
import 'features/auth/presentation/otp_screen.dart';
import 'features/auth/presentation/pin_setup_screen.dart';
import 'features/auth/presentation/kyc_screen.dart';

import 'features/shopping/presentation/product_detail_screen.dart';
import 'features/shopping/presentation/cart_checkout_screen.dart';
import 'features/shopping/presentation/order_tracking_screen.dart';
import 'features/shopping/presentation/promo_offer_screen.dart';

import 'features/wallet/presentation/wallet_dashboard_screen.dart';
import 'features/wallet/presentation/topup_methods_screen.dart';
import 'features/wallet/presentation/payment_confirmation_screen.dart';
import 'features/wallet/presentation/transaction_receipt_screen.dart';
import 'features/wallet/presentation/payment_services_screen.dart';
import 'features/wallet/presentation/transfer_setup_screen.dart';
import 'features/wallet/presentation/transfer_confirmation_screen.dart';
import 'features/wallet/presentation/transfer_success_screen.dart';
import 'features/wallet/presentation/capital_subscription_screen.dart';

import 'features/delivery/presentation/delivery_dashboard_screen.dart';
import 'features/delivery/presentation/delivery_request_screen.dart';
import 'features/delivery/presentation/delivery_tracking_screen.dart';
import 'features/delivery/presentation/delivery_steps_screen.dart';
import 'features/delivery/presentation/delivery_chat_screen.dart';
import 'features/delivery/presentation/delivery_earnings_screen.dart';

import 'features/trading/presentation/trading_dashboard_screen.dart';
import 'features/trading/presentation/trading_sale_screen.dart';
import 'features/trading/presentation/trading_confirmation_screen.dart';
import 'features/trading/presentation/trading_negotiation_screen.dart';
import 'features/trading/presentation/trading_transit_list_screen.dart';
import 'features/trading/presentation/trading_transit_details_screen.dart';

import 'features/vendor/presentation/vendor_dashboard_screen.dart';
import 'features/vendor/presentation/vendor_add_product_screen.dart';
import 'features/vendor/presentation/vendor_orders_screen.dart';
import 'features/vendor/presentation/vendor_order_details_screen.dart';

import 'features/settings/presentation/notifications_screen.dart';
import 'features/settings/presentation/settings_screen.dart';
import 'features/settings/presentation/referral_screen.dart';

import 'features/profile/presentation/profile_screen.dart';

void main() {
  runApp(const ProviderScope(child: TornadoesApp()));
}

class TornadoesApp extends StatelessWidget {
  const TornadoesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const PhoneLoginScreen(),
        ),
        GoRoute(path: '/otp', builder: (context, state) => const OtpScreen()),
        GoRoute(
          path: '/pin-setup',
          builder: (context, state) => const PinSetupScreen(),
        ),
        GoRoute(path: '/kyc', builder: (context, state) => const KycScreen()),
        GoRoute(
          path: '/product-detail',
          builder: (context, state) => const ProductDetailScreen(),
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) => const CartCheckoutScreen(),
        ),
        GoRoute(
          path: '/order-tracking',
          builder: (context, state) => const OrderTrackingScreen(),
        ),
        GoRoute(
          path: '/promo',
          builder: (context, state) => const PromoOfferScreen(),
        ),
        GoRoute(
          path: '/wallet-dashboard',
          builder: (context, state) => const WalletDashboardScreen(),
        ),
        GoRoute(
          path: '/topup',
          builder: (context, state) => const TopupMethodsScreen(),
        ),
        GoRoute(
          path: '/payment-confirmation',
          builder: (context, state) => const PaymentConfirmationScreen(),
        ),
        GoRoute(
          path: '/transaction-receipt',
          builder: (context, state) => const TransactionReceiptScreen(),
        ),
        GoRoute(
          path: '/wallet-payment',
          builder: (context, state) => const PaymentServicesScreen(),
        ),
        GoRoute(
          path: '/wallet-transfer-setup',
          builder: (context, state) => const TransferSetupScreen(),
        ),
        GoRoute(
          path: '/wallet-transfer-confirmation',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>? ?? {};
            return TransferConfirmationScreen(
              method: extra['method'] as String? ?? 'MoMo',
              phone: extra['phone'] as String? ?? '',
              amount: extra['amount'] as String? ?? '0',
            );
          },
        ),
        GoRoute(
          path: '/wallet-transfer-success',
          builder: (context, state) => const TransferSuccessScreen(),
        ),
        GoRoute(
          path: '/wallet-capital',
          builder: (context, state) => const CapitalSubscriptionScreen(),
        ),
        GoRoute(
          path: '/delivery-dashboard',
          builder: (context, state) => const DeliveryDashboardScreen(),
        ),
        GoRoute(
          path: '/delivery-request',
          builder: (context, state) => const DeliveryRequestScreen(),
        ),
        GoRoute(
          path: '/delivery-tracking',
          builder: (context, state) => const DeliveryTrackingScreen(),
        ),
        GoRoute(
          path: '/delivery-steps',
          builder: (context, state) => const DeliveryStepsScreen(),
        ),
        GoRoute(
          path: '/delivery-chat',
          builder: (context, state) => const DeliveryChatScreen(),
        ),
        GoRoute(
          path: '/delivery-earnings',
          builder: (context, state) => const DeliveryEarningsScreen(),
        ),
        GoRoute(
          path: '/trading-dashboard',
          builder: (context, state) => const TradingDashboardScreen(),
        ),
        GoRoute(
          path: '/trading-sale',
          builder: (context, state) => const TradingSaleScreen(),
        ),
        GoRoute(
          path: '/trading-confirmation',
          builder: (context, state) => const TradingConfirmationScreen(),
        ),
        GoRoute(
          path: '/trading-negotiation',
          builder: (context, state) => const TradingNegotiationScreen(),
        ),
        GoRoute(
          path: '/trading-transit',
          builder: (context, state) => const TradingTransitListScreen(),
        ),
        GoRoute(
          path: '/trading-transit-details',
          builder: (context, state) => const TradingTransitDetailsScreen(),
        ),
        GoRoute(
          path: '/vendor-dashboard',
          builder: (context, state) => const VendorDashboardScreen(),
        ),
        GoRoute(
          path: '/vendor-add-product',
          builder: (context, state) => const VendorAddProductScreen(),
        ),
        GoRoute(
          path: '/vendor-orders',
          builder: (context, state) => const VendorOrdersScreen(),
        ),
        GoRoute(
          path: '/vendor-order-details',
          builder: (context, state) => const VendorOrderDetailsScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/notifications',
          builder: (context, state) => const NotificationsScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: '/referral',
          builder: (context, state) => const ReferralScreen(),
        ),
        GoRoute(path: '/', builder: (context, state) => const RootScreen()),
      ],
    );

    return MaterialApp.router(
      title: 'Tornadoes',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
