//
//  WKTimeHidingInterfaceController.m
//  Face Extension
//
//  Created by Michael Hill on 12/20/19.
//  Copyright © 2019 Michael Hill. All rights reserved.
//

#import <Foundation/Foundation.h>
@import ObjectiveC.runtime;
#import "WKTimeHidingInterfaceController.h"

@interface NSObject (fs_override)
-(NSString*)timeText;
@end

@implementation WKTimeHidingInterfaceController

+ (void)load {
    Class CLKTimeFormatter = NSClassFromString(@"CLKTimeFormatter");
    if ([CLKTimeFormatter instancesRespondToSelector:@selector(timeText)]) {
        Method m = class_getInstanceMethod(CLKTimeFormatter, @selector(timeText));
        method_setImplementation(m, imp_implementationWithBlock(^NSString*(id self, SEL _cmd) { return @" "; }));
    }
}

@end
