//
//  WordTile.m
//  QuoteSmith
//
//  Created by waffles on 4/2/14.
//  Copyright (c) 2014 Anthony LaMantia. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIColor+Expanded.h"
#import "WordTile.h"
#import "AppContext.h"

@interface WordTile () {
    UIView    *highlightView;
    UILabel   *label;
    NSString  *str;
    CGRect    targetRect;
    BOOL      animating;
    CGPoint   tweenTarget;
}
@end

@implementation WordTile

- (NSString *) str
{
    return str;
}

- (void) executeNext
{
    return;
}

- (void) executeTween
{
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGRect dFrame = self.frame;
                         dFrame.origin.x = tweenTarget.x;
                         dFrame.origin.y = tweenTarget.y;
                         self.frame = dFrame;
                     } completion:^(BOOL finished) {
                         
                     }];
}

// would it be a good idea to use facebook pop?
- (void) addTweenTarget : (CGPoint) target
{
    tweenTarget.x = target.x;
    tweenTarget.y = target.y;
    return;
}

- (void) setup
{
    self.backgroundColor = [UIColor colorWithHexString:@"17b680"];
    str = @"Internet";
    highlightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    highlightView.opaque          = NO;
    highlightView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:highlightView];
    label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.font = [[AppContext sharedContext] fontForType:FONT_TYPE_TILE];
    [self addSubview:label];
    return;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        self.customColors = NO;
        self.line = 0;
        animating = NO;
    }
    return self;
}

- (void) setString : (NSString *) _str
{
    str = _str.copy;
    return;
}

- (void) highlightGreen
{
    if (animating)
        return;
    animating = YES;
    [UIView animateWithDuration:0.40f
                          delay:0.0f
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         highlightView.backgroundColor = [UIColor colorWithHexString:@"00ff00"];
                         highlightView.backgroundColor = [UIColor colorWithHexString:@"ffffff"];

                         highlightView.alpha = 0.60;
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.3f
                                               delay:0.0f
                                             options:UIViewAnimationOptionAllowUserInteraction
                                          animations:^{
                                              highlightView.backgroundColor = [UIColor clearColor];
                                          }
                                          completion:^(BOOL finished) {
                                              animating = NO;
                                              
                                          }
                          ];
                     }
     ];
    return;
}

- (void) highlightRed
{
    if (animating)
        return;
    animating = YES;
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         highlightView.backgroundColor = [UIColor colorWithHexString:@"ff0000"];
                         highlightView.alpha = 0.25;
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:0.3f
                                               delay:0.0f
                                             options:UIViewAnimationOptionAllowUserInteraction
                                          animations:^{
                                              highlightView.backgroundColor = [UIColor clearColor];
                                          }
                                          completion:^(BOOL finished) {
                                              
                                              animating = NO;
                                              
                                          }
                          ];
                         
                     }
     ];
}

- (void) layoutSubviews {
    float viewPadding = 0.0;
    
    if (self.mode == TILE_MODE_GAME) {
        viewPadding = 10.0;
    }
    
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 0.0f;
    
    label.text = str;
    CGSize max = CGSizeMake(600, 600);
    CGSize expected = [label.text sizeWithFont:label.font constrainedToSize:max lineBreakMode:label.lineBreakMode];

    CGRect frame;
    frame = CGRectMake(viewPadding,viewPadding, expected.width, expected.height);
    label.frame = frame;
    
    CGRect of = self.frame;
    of.size.width = expected.width   + (viewPadding * 2);
    of.size.height = expected.height + (viewPadding *2);
    
    if (self.mode == TILE_MODE_WIN) {
        self.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blackColor];
    }
    
    if (self.customColors == YES) {
        self.backgroundColor = self.bgColor;
        label.textColor = self.fgColor;
        if (self.mode == TILE_MODE_GAME) {
            self.layer.borderColor = [UIColor blackColor].CGColor;
            self.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor blackColor];
            self.layer.borderWidth = 1.0;
        }
    }

    self.frame = of;
    highlightView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
