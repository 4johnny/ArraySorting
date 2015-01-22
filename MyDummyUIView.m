//
//  MyDummyUIView.m
//  ArraySorting
//
//  Created by Johnny on 2015-01-21.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "MyDummyUIView.h"

@implementation MyDummyUIView

-(instancetype) initWithBounds:(CGRect) bounds {
	
	self = [super init];
	if (self) {
		
		_bounds = bounds;
		
	}
	return self;
}

-(instancetype) init {
	
	return [self initWithBounds:CGRectMake(0, 0, 0, 0)];
}

+(MyDummyUIView*) myDummyUIViewWithBounds:(CGRect) bounds {
	
	return [[MyDummyUIView alloc] initWithBounds:bounds];
}

-(NSString*) description {

	return [NSString stringWithFormat:@"{Width:%.0f, Height:%.0f, Area:%.0f}", self.bounds.size.width, self.bounds.size.height, self.bounds.size.width * self.bounds.size.height];
}

@end
