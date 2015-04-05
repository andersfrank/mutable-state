//
//  TransactionsViewController.m
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "ReactiveTransactionsViewController.h"
#import "Transaction.h"
#import "BottomBar.h"
#import "TransactionView.h"

@interface ReactiveTransactionsViewController ()

@property (nonatomic) NSArray *transactions;
@property (nonatomic) TransactionView *view;

@end

@implementation ReactiveTransactionsViewController

- (instancetype)initWithTransactions:(NSArray *)transactions {
    self = [super init];
    if (self) {
        self.transactions = transactions;
        self.title = @"Reactive";
    }
    return self;
}

- (void)loadView {
    self.view = [[TransactionView alloc] initWithTarget:self
                                           removeAction:@selector(removeRandomTransaction)
                                        removeAllAction:@selector(removeAllTransactions)
                                              addAction:@selector(addRandomTransaction)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RAC(self.view.balanceLabel,text) =
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
