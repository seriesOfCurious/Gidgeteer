//
//  FontUtil.h
//  Gidgeteer
//
//  Created by Justin Noormand on 5/9/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseUtil.h"

@interface FontUtil : BaseUtil

@property (nonatomic) UIFont *defaultFont;
@property (nonatomic) UIFont *defaultBoldFont;
@property (nonatomic) UIFont *defaultItalicFont;
+(void)setFontInAllViewsAndSubviewsOf:(UIView*)view preserveSize:(BOOL)preserveSize;


@end
