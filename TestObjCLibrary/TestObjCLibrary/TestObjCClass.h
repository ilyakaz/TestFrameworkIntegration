//
//  TestObjCClass.h
//  TestSwiftFramework
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#ifdef BUILT_AS_FRAMEWORK
@interface TestObjCClass : NSObject
-(void)printTestMessage;
@end
#endif
NS_ASSUME_NONNULL_END
