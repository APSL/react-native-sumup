import { NativeModules } from 'react-native'
const SumupSDK = NativeModules.RNSumup

var Sumup = {
  setupWithAPIKey(apiKey) {
    SumupSDK.setupWithAPIKey(apiKey);
  },
  presentLoginFromViewController(completionBlock) {
    SumupSDK.presentLoginFromViewController(completionBlock);
  },
  checkoutWithRequest(request, completionBlock, errorBlock) {
    SumupSDK.checkoutWithRequest(request, completionBlock, errorBlock);
  },
  paymentOptionAny: SumupSDK.SMPPaymentOptionAny,
  paymentOptionCardReader: SumupSDK.SMPPaymentOptionCardReader,
  paymentOptionMobilePayment: SumupSDK.SMPPaymentOptionMobilePayment,
};
module.exports = Sumup;
