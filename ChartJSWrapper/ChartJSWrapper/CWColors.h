//
//  CWColors.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 23/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CWColors : NSObject
- (NSColor*) pickColor;
+ (CWColors*) sharedColors;
@end
