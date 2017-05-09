//
//  FontUtil.m
//  Gidgeteer
//
//  Created by Justin Noormand on 5/9/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import "FontUtil.h"
#import "NSStringCategories.h"

@implementation FontUtil

+(instancetype)instance {
    static FontUtil * thisInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thisInstance = [[self alloc] init];
    });
    thisInstance.defaultFont = [UIFont fontWithName:@"Avenir-Book" size:17.0f];
    thisInstance.defaultBoldFont = [UIFont fontWithName:@"Avenir-Heavy" size:17.0f];
    thisInstance.defaultItalicFont = [UIFont fontWithName:@"Avenir-Oblique" size:17.0f];
    return thisInstance;
}

+(void)setFontInAllViewsAndSubviewsOf:(UIView*)view preserveSize:(BOOL)preserveSize {
    CGFloat sizeToApply = [FontUtil instance].defaultFont.pointSize;
    if([view respondsToSelector:@selector(font)]) {
        UIFont *oldFont = (UIFont*)[view valueForKey:@"font"];
        UIFont *newFont = nil;
        if(preserveSize) {
            sizeToApply = oldFont.pointSize;
        }
        // preserve style
        if([oldFont.fontName containsString:@"Bold"] || [oldFont.fontName containsString:@"Heavy"]) {
            newFont = [UIFont fontWithName:[FontUtil instance].defaultBoldFont.fontName size:sizeToApply];
        }
        else if([oldFont.fontName containsString:@"Italic"] || [oldFont.fontName containsString:@"Oblique"]) {
            newFont = [UIFont fontWithName:[FontUtil instance].defaultItalicFont.fontName size:sizeToApply];
        }
        else {
            newFont = [UIFont fontWithName:[FontUtil instance].defaultFont.fontName size:sizeToApply];
        }
        
        [view setValue:newFont forKey:@"font"];
    }
    
    
    // base case
    if([view.subviews count] == 0) {
        return;
    }
    else {
        for(UIView *subView in view.subviews) {
            [FontUtil setFontInAllViewsAndSubviewsOf:subView preserveSize:preserveSize];
        }
    }
}

@end
