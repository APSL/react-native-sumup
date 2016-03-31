import { NativeModules } from 'react-native'
const SumupSDK = NativeModules.RNSumup

var Sumup = {
  setupWithAPIKey(apiKey) {
    return SumupSDK.setupWithAPIKey(apiKey);
  },
  presentLoginFromViewController() {
    return SumupSDK.presentLoginFromViewController();
  },
  checkoutWithRequest(request) {
    return SumupSDK.checkoutWithRequest(request);
  },
  isLoggedIn() {
    return SumupSDK.isLoggedIn().then(result => result.isLoggedIn)
  },
  paymentOptionAny: SumupSDK.SMPPaymentOptionAny,
  paymentOptionCardReader: SumupSDK.SMPPaymentOptionCardReader,
  paymentOptionMobilePayment: SumupSDK.SMPPaymentOptionMobilePayment,
};
module.exports = Sumup;
