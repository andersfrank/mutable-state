//
//  MutableTransactionsViewController.m
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import "MutableTransactionsViewController.h"
#import "Transaction.h"
#import "TransactionView.h"

@interface MutableTransactionsViewController ()

@property (nonatomic) NSArray *transactions;
@property (nonatomic) CGFloat balance;
@property (nonatomic) TransactionView *view;

@end

@implementation MutableTransactionsViewController

- (instancetype)initWithTransactions:(NSArray *)transactions
{
    self = [super init];
    if (self) {
        self.title = @"Mutable Balance";
        self.transactions = transactions;
        
        // Mutting state
        self.balance = [self sumOfTransactions:self.transactions];
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
    [self updateBalanceLabel];
}

- (void)updateBalanceLabel {
    self.view.balanceLabel.text = [NSString stringWithFormat:@"Current balance: $%0.1f",[self balance]];
}

- (CGFloat )sumOfTransactions:(NSArray *)transactions {
    __block CGFloat sum = 0;
    [transactions enumerateObjectsUsingBlock:^(Transaction *transaction, NSUInteger idx, BOOL *stop) {
        sum += transaction.amount;
    }];
    return sum;
}

- (Transaction *)randomTransaction {
    NSInteger amount = arc4random_uniform(1000);
    return [[Transaction alloc] initWithAmount:amount];
}

#pragma mark - Actions

- (void)addRandomTransaction {
    
    if (!self.transactions) {
        self.transactions = @[];
    }
    
    Transaction *transaction = [self randomTransaction];
    self.transactions = [self.transactions arrayByAddingObject:transaction];
    
    // Mutating state
    self.balance += transaction.amount;
    
    [self updateBalanceLabel];
}

- (void)removeRandomTransaction {
    if (self.transactions.count == 0) {
        return;
    }
    
    NSMutableArray *transactions = [NSMutableArray arrayWithArray:self.transactions];
    Transaction *transaction = transactions[arc4random_uniform((int)[transactions count])];
    [transactions removeObject:transaction];
    
    // Mutating state
    self.balance -= transaction.amount;
    self.transactions = [NSArray arrayWithArray:transactions];

    [self updateBalanceLabel];
}

- (void)removeAllTransactions {
    self.transactions = @[];
    
    // Mutating state
    self.balance = 0;
    [self updateBalanceLabel];
}

@end
