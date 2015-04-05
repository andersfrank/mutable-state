//
//  ReactiveMVVMTransactionsViewModel.m
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "ReactiveMVVMTransactionsViewModel.h"
#import "Transaction.h"

@interface ReactiveMVVMTransactionsViewModel ()

@property (nonatomic) NSArray *transactions;

@end

@implementation ReactiveMVVMTransactionsViewModel

- (instancetype)initWithTransactions:(NSArray *)transactions
{
    self = [super init];
    if (self) {
     
        self.transactions = transactions;
        
        RAC(self,balanceLabelText) =
        [[RACObserve(self, transactions)
        map:^id(NSArray *transactions) {
            return [transactions.rac_sequence
                    foldLeftWithStart:@0 reduce:^id(NSNumber *accumulator, Transaction *transaction) {
                        return @(accumulator.floatValue + transaction.amount);
                    }];
        }] map:^id(NSNumber *sum) {
            return [NSString stringWithFormat:@"Current balance: $%0.1f",sum.floatValue];
        }];
        
    }
    return self;
}

#pragma mark - Actions

- (void)addRandomTransaction {
    if (!self.transactions) {
        self.transactions = @[];
    }
    self.transactions = [self.transactions arrayByAddingObject:[[Transaction alloc] initWithRandomAmount]];
}

- (void)removeRandomTransaction {
    if (self.transactions.count == 0) {
        return;
    }
    NSMutableArray *transactions = [NSMutableArray arrayWithArray:self.transactions];
    Transaction *transaction = transactions[arc4random_uniform((int)[transactions count])];
    [transactions removeObject:transaction];
    self.transactions = [NSArray arrayWithArray:transactions];
}

- (void)removeAllTransactions {
    self.transactions = @[];
}

@end
