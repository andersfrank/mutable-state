//
//  Transaction.m
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction

- (instancetype)initWithAmount:(CGFloat)amount
{
    self = [super init];
    if (self) {
        self.amount = amount;
    }
    return self;
}

- (instancetype)initWithRandomAmount {
    return [self initWithAmount:arc4random_uniform(1000)];
}

@end
