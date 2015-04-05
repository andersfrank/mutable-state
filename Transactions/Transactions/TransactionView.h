//
//  TransactionView.h
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionView : UIView

- (instancetype)initWithTarget:(id)target
                  removeAction:(SEL)removeAction
               removeAllAction:(SEL)removeAllAction
                     addAction:(SEL)addAction;

@property (nonatomic, readonly) UILabel *balanceLabel;

@end

