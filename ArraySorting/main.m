//
//  main.m
//  ArraySorting
//
//  Created by Johnny on 2015-01-21.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyDummyUIView.h"

#if __has_feature(objc_arc)
#define MDLog(format, ...) CFShow((__bridge CFStringRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define MDLog(format, ...) CFShow([NSString stringWithFormat:format, ## __VA_ARGS__]);
#endif


int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		// Strings
		NSArray* strings =
		@[
		  @"eeeeeAAbfdf",
		  @"Everything",
		  @"news to me",
		  @"timepiece",
		  @"egg",
		  @"eggs",
		  @"paper",
		  @"e",
		  @"facebook",
		  @"painting",
		  @"231 thurlow st",
		  @"99 bottles"
		  ];
		MDLog(@"Strings: %@", strings);
		
		
		// Sorted Alphabetically
		NSArray* stringsByAlphabet =
		[strings sortedArrayUsingComparator:^(NSString* str1, NSString* str2) {
			
			return [str1 caseInsensitiveCompare:str2];
		}];
		MDLog(@"Sorted Alphabetically: %@", stringsByAlphabet);
		
		
		// Sorted by Length
		NSArray* stringsByLength =
		[strings sortedArrayUsingComparator:^(NSString* str1, NSString* str2) {
			
			return (NSComparisonResult)(str2.length - str1.length);
		}];
		MDLog(@"Sorted Lengthwise: %@", stringsByLength);
		
		
		// Sorted by Last Char
		NSArray* stringsByLastChar =
		[strings sortedArrayUsingComparator:^(NSString* str1, NSString* str2) {
			
			return [[str1 substringFromIndex:str1.length]
					caseInsensitiveCompare:[str2 substringFromIndex:str2.length - 1]];
		}];
		MDLog(@"Sorted by Last Char: %@", stringsByLastChar);
		
		
		// Sorted by Occurrences of 'e'
		NSString* charStr = @"e";
		NSArray* stringsByCharOccurrences =
		[strings sortedArrayUsingComparator:^(NSString* str1, NSString* str2) {
			
			NSUInteger str1CountChar =
			[str1.mutableCopy
			 replaceOccurrencesOfString:charStr withString:charStr
			 options:(NSStringCompareOptions)0 range:NSMakeRange(0, str1.length)];
			
			NSUInteger str2CountChar =
			[str2.mutableCopy
			 replaceOccurrencesOfString:charStr withString:charStr
			 options:(NSStringCompareOptions)0 range:NSMakeRange(0, str2.length)];
			
			return (NSComparisonResult)(str2CountChar - str1CountChar);
		}];
		MDLog(@"Sorted by Occurrences of '%@': %@", charStr, stringsByCharOccurrences);
		
		
		// Excluded Strings with 'e'.
		NSArray* stringsByExcludingStringsWithChar =
		[strings filteredArrayUsingPredicate:
		 [NSPredicate predicateWithBlock:^BOOL(NSString* str, NSDictionary* bindings) {
			
			return ![str containsString:charStr];
		}]];
		MDLog(@"Filtered by Excluding Strings with '%@': %@", charStr, stringsByExcludingStringsWithChar);
		
		
		// Sort Views by Area
		NSArray* myDummyUIViews =
		@[
		  [MyDummyUIView myDummyUIViewWithBounds:CGRectMake(0, 0, 10, 100)],
		  [MyDummyUIView myDummyUIViewWithBounds:CGRectMake(0, 0, 50, 4)],
		  [MyDummyUIView myDummyUIViewWithBounds:CGRectMake(0, 0, 20, 400)],
		  [MyDummyUIView myDummyUIViewWithBounds:CGRectMake(0, 0, 2, 5)]
		  ];
		MDLog(@"Views: %@", myDummyUIViews);
		
		NSArray* viewsSortedByArea =
		[myDummyUIViews sortedArrayUsingComparator:^NSComparisonResult(MyDummyUIView* view1, MyDummyUIView* view2) {

			int view1Area = view1.bounds.size.width * view1.bounds.size.height;
			int view2Area = view2.bounds.size.width * view2.bounds.size.height;
			
			return (NSComparisonResult)(view2Area - view1Area);
		}];
		MDLog(@"Sorted Views by Area: %@", viewsSortedByArea);
		

	} // @autoreleasepool
	
	return 0;
}
