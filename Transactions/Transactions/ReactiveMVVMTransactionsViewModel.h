//
//  ReactiveMVVMTransactionsViewModel.h
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReactiveMVVMTransactionsViewModel : NSObject

@property (nonatomic, readonly) NSString *balanceLabelText;

- (instancetype)initWithTransactions:(NSArray *)transactions;

- (void)addRandomTransaction;
- (void)removeRandomTransaction;
- (void)removeAllTransactions;

@end
