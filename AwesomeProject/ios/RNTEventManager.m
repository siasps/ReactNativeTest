//
//  RNTEventManager.m
//  AwesomeProject
//
//  Created by peng on 2020/4/28.
//

#import "RNTEventManager.h"

@implementation RNTEventManager
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(doSomethingCallback:(NSString *)string callback:(RCTResponseSenderBlock)callback){
  
  
  
  callback(@[[NSNull null],@[@"test1",@"test2"]]);
  
  NSLog(@"------%@",string);

}

RCT_EXPORT_METHOD(buttonClickTest){
  NSLog(@"========");
  
}


- (NSArray<NSString *> *)supportedEvents
{
  return @[@"selectItem"];
}

- (void)sendSelectItem:(NSDictionary *)obj
{
  [self sendEventWithName:@"selectItem" body:obj];
}

//.m文件
+(id)allocWithZone:(NSZone *)zone {
  static RNTEventManager *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [super allocWithZone:zone];
  });
  return sharedInstance;
}
@end
