#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTLog.h"
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(BgLocation, RCTEventEmitter)

RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(startLocation)
RCT_EXTERN_METHOD(stopLocation)
RCT_EXTERN_METHOD(setDesiredDistance:(double)distance
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

@end
