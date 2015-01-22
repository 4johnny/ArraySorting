//
//  main.m
//  ArraySorting
//
//  Created by Johnny on 2015-01-21.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_feature(objc_arc)
#define MDLog(format, ...) CFShow((__bridge CFStringRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define MDLog(format, ...) CFShow([NSString stringWithFormat:format, ## __VA_ARGS__]);
#endif


int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		// Strings
		NSArray* strings = @[
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
		NSArray* stringsByAlphabet = [strings sortedArrayUsingComparator:^(NSString* str1, NSString* str2) {
			return [str1 caseInsensitiveCompare:str2];
		}];
		MDLog(@"Sorted Alphabetically: %@", stringsByAlphabet);

		// Sorted by Length
		NSArray* stringsByLength = [strings sortedArrayUsingComparator: ^(NSString* str1, NSString* str2) {
			
			if (str1.length < str2.length) return (NSComparisonResult)NSOrderedDescending;
			if (str1.length > str2.length) return (NSComparisonResult)NSOrderedAscending;
			return (NSComparisonResult)NSOrderedSame;
		}];
		MDLog(@"Sorted Lengthwise: %@", stringsByLength);
	}
	return 0;
}
