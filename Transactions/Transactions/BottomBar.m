//
//  BottomBar.m
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import "BottomBar.h"

@implementation BottomBar

- (instancetype)initWithFrame:(CGRect)frame target:(id)target removeAction:(SEL)removeAction removeAllAction:(SEL)removeAllAction addAction:(SEL)addAction
{
    self = [super initWithFrame:frame];
    if (self) {
        self.items = @[
                          [[UIBarButtonItem alloc] initWithTitle:@"--" style:UIBarButtonItemStylePlain
                                                          target:target
                                                          action:removeAction],
                          [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                        target:nil
                                                                        action:nil],
                          [[UIBarButtonItem alloc] initWithTitle:@"Remove All" style:UIBarButtonItemStylePlain
                                                          target:target
                                                          action:removeAllAction],
                          [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                        target:nil
                                                                        action:nil],
                          [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                        target:target
                                                                        action:addAction]
                          ];
 
    }
    return self;
}

@end
