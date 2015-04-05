//
//  Transaction.h
//  Transactions
//
//  Created by Anders Frank on 2015-04-05.
//  Copyright (c) 2015 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Transaction : NSObject

- (instancetype)initWithAmount:(CGFloat)amount;

- (instancetype)initWithRandomAmount;

@property (nonatomic) CGFloat amount;

@end
