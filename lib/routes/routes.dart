abstract class AppRoutes {
  static const home = '/';
  static const intro = '/intro';
  // Auth
  static const auth = '/auth';
  static const verifyEmail = '/auth/verify-email';

  // KYC
  static const kyc = '/kyc';

  // MF
  static const MFLanding = '/mf';
  static const MFPortfolio = '/mf/portfolio';
  static const MFDashboard = '/mf/dashboard';
  static const MFDetail = '/mf/dashboard';
  static const MFListing = '/mf/listing';
  static const MFOrderDetail = '/mf/order-detail';

  // Gold
  static const digiGoldLanding = '/digi-gold';
  static const digiGoldInvest = '/digi-gold/invest';
  static const digiGoldBuy = '/digi-gold/buy';
  static const digiGoldSell = '/digi-gold/sell';
  static const digiGoldDetail = '/digi-gold/detail';
  static const digiGoldVault = '/digi-gold/vault';
}
