//
//  MyDummyUIView.h
//  ArraySorting
//
//  Created by Johnny on 2015-01-21.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDummyUIView : NSObject

@property (nonatomic) CGRect bounds;

-(instancetype) initWithBounds:(CGRect) bounds;

+(MyDummyUIView*) myDummyUIViewWithBounds:(CGRect) bounds;

@end
