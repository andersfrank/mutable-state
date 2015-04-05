//
//  TransactionView.m
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import "TransactionView.h"

@interface TransactionView ()

@property (nonatomic) UILabel *balanceLabel;
@property (nonatomic) UIToolbar *toolbar;

@end

@implementation TransactionView

- (instancetype)initWithTarget:(id)target
                 removeAction:(SEL)removeAction
              removeAllAction:(SEL)removeAllAction
                    addAction:(SEL)addAction {
    
    self = [super initWithFrame:CGRectZero];
    if (self) {

        self.backgroundColor = [UIColor lightGrayColor];
        
        self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectZero];
        self.toolbar.items = @[
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
        [self addSubview:self.toolbar];
        
        self.balanceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.balanceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.balanceLabel];

    }
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect slice, remainder;
    CGRectDivide(self.bounds, &slice, &remainder, 44, CGRectMaxYEdge);
    self.toolbar.frame = slice;
    
    self.balanceLabel.frame = self.bounds;
    
}

@end
