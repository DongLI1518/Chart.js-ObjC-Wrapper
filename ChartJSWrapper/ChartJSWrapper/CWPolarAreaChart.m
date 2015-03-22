//
//  CWPolarAreaChart.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWPolarAreaChart.h"

@implementation CWPolarAreaChart
- (instancetype) initWithWindowScriptObject:(id) win name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(NSArray*)data options:(CWPolarAreaChartOptions*) options {
	self = [super initWithWindowScriptObject:win name:name width:w height:h];
	if(self) {
		_data = [NSMutableArray arrayWithArray:data];
		_options = options;
		if(!_options) {
			_options = [[CWPolarAreaChartOptions alloc] init];
		}
	}
	return self;
}

- (void) addChart {
	NSString* dataJSON = [self convertToJSON:self.data];
	NSString* optJSON = [self.options JSON];
	
	NSArray* params = @[self.name,@(self.width),@(self.height),dataJSON,optJSON];
	
	id res = [self.win callWebScriptMethod:@"addPolarAreaChart" withArguments:params];
	
	NSLog(@"Result is:%@",res);
}

//myPolarAreaChart.segments[1].value = 10;
- (void) setValue:(NSNumber*)val inSegment:(NSInteger)segment {
	NSMutableArray* arr = (NSMutableArray*)_data;
	arr[segment] = val;
	[_data setValue:val ];
	NSArray* params = @[self.name,@(segment),val];
	
	id res = [self.win callWebScriptMethod:@"setSegmentValue" withArguments:params];
	
	NSLog(@"Result setSegmentValue is:%@",res);
}

@end
