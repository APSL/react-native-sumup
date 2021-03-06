# react-native-sumup

A React Native implementation of SumupSDK.

<p align="center">
<img src="https://raw.githubusercontent.com/wiki/APSL/react-native-sumup/sumup.png" alt="Sumup Login" width="400">
</p>

## Installation

First install the iOS Sumup SDK, [instructions here](https://github.com/sumup/sumup-ios-sdk#preparing-your-xcode-project).

Then, ``npm install react-native-sumup --save`` and add ``RNSumup.h`` and ``RNSumup.m`` to your project. Check that the ``*.m`` file is under **Compile Sources**.

## Compatibility

This library has been tested with Sumup iOS SDK version **1.2.2**.

## Example usage
```javascript
import Sumup from 'react-native-sumup'
// Setup Sumup
Sumup.setupWithAPIKey('API_KEY')
// Open login
Sumup.presentLoginFromViewController()
  .then(response => {
    console.log('Response', response)
  })
  .catch(error => {
    console.log('error', error)
  })

// Checkout
let request = {
  totalAmount: '20.0',
  title: 'Test',
  currencyCode: 'EUR',
  paymentOption: Sumup.paymentOptionMobilePayment
}
Sumup.checkoutWithRequest(request)
  .then(response) => {
    console.log('Response', response)
  })
  .catch(error) => {
    console.log('Error', error)
  })
```

## API 🚧

This library is still a work in progress, only some methods have been implemented. Please feel free to open any issues if you need another SDK method implemented.

| Method | Params | Description |
|--------|--------|-------------|
| ``setupWithAPIKey `` | ``apiKey``: String | Method to initialize SumupSDK. |
| ``presentLoginFromViewController`` | ``completionBlock``: function | Opens a Sumup login view. |
| ``checkoutWithRequest`` | ``request``: Object, ``completionBlock(response)``: function, ``errorBlock(error)``: function | Creates a Sumup payment request. |
| `isLoggedIn` | | Returns `true` if the user has logged-in into the SDK. |

### ``Request`` param

| Param |  Type | Description |
|-------|-------|-------------|
| ``totalAmount`` | ``string`` | Will be parsed as ``decimalNumber``. |
| ``title`` | ``string`` | |
| ``currencyCode`` | ``string`` | |
| ``paymentOption`` | ``SMPPaymentOptions`` | An enum of type ``SMPPaymentOptions``. Possible values: ``SMPPaymentOptionAny``, ``SMPPaymentOptionCardReader``, ``SMPPaymentOptionMobilePayment``. |

## License

MIT.

## Development sponsor

This development has been sponsored by [SupSpot](http://supspot.ch).
