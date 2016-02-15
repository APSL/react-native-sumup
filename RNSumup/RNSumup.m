//
//  RNSumup.m
//  RNSumup
//
//  Created by Alvaro Medina Ballester on 11/02/16.
//  Copyright © 2016 APSL. All rights reserved.
//


#import "RNSumup.h"

@implementation RCTConvert (SMPPaymentOptions)

RCT_ENUM_CONVERTER(SMPPaymentOptions, (
    @{@"SMPPaymentOptionAny"           : @(SMPPaymentOptionAny),
      @"SMPPaymentOptionCardReader"    : @(SMPPaymentOptionCardReader),
      @"SMPPaymentOptionMobilePayment" : @(SMPPaymentOptionMobilePayment)
}), SMPPaymentOptionAny, integerValue);

@end

@implementation RNSumup

RCT_EXPORT_MODULE();

- (NSDictionary *)constantsToExport
{
    return @{ @"SMPPaymentOptionAny": @(SMPPaymentOptionAny),
              @"SMPPaymentOptionCardReader": @(SMPPaymentOptionCardReader),
              @"SMPPaymentOptionMobilePayment": @(SMPPaymentOptionMobilePayment)};
}

RCT_EXPORT_METHOD(setupWithAPIKey:(NSString *)apiKey)
{
    [SumupSDK setupWithAPIKey:apiKey];
}

RCT_EXPORT_METHOD(presentLoginFromViewController:(RCTResponseSenderBlock)completionBlock)
{
    UIViewController *rootViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
    [SumupSDK presentLoginFromViewController:rootViewController
                                    animated:YES
                             completionBlock:^(BOOL success, NSError *error) {
                                 completionBlock(@[[NSDictionary dictionaryWithObjectsAndKeys:@(success), @"success", nil]]);
                             }];
}

RCT_EXPORT_METHOD(checkoutWithRequest:(NSDictionary *)request completionBlock:(RCTResponseSenderBlock)completionBlock errorBlock:(RCTResponseErrorBlock)errorBlock)
{
    UIViewController *rootViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
    NSDecimalNumber *total = [NSDecimalNumber decimalNumberWithString:[RCTConvert NSString:request[@"totalAmount"]]];
    NSString *title = [RCTConvert NSString:request[@"title"]];
    NSString *currencyCode = [RCTConvert NSString:request[@"currencyCode"]];
    NSUInteger paymentOption = [RCTConvert SMPPaymentOptions:request[@"paymentOption"]];
    SMPCheckoutRequest *checkoutRequest = [SMPCheckoutRequest requestWithTotal:total
                                                                         title:title
                                                                  currencyCode:currencyCode
                                                                paymentOptions:paymentOption];
    [SumupSDK checkoutWithRequest:checkoutRequest
               fromViewController:rootViewController
                       completion:^(SMPCheckoutResult *result, NSError *error) {
                           if (error) {
                               errorBlock(error);
                           } else {
                               completionBlock(@[[NSDictionary dictionaryWithObjectsAndKeys:result, @"result", nil]]);
                           }
                       }];
}

@end
