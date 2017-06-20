//
//  CoinItem.h
//  BlockChainMarket
//
//  Created by Kory.Zhang on 2017/6/19.
//  Copyright © 2017年 Kory.Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoinInfo.h"

@interface CoinItem :NSObject

@property NSString* id;
@property CoinInfo* coinInfo;
@property NSNumber* timestamp;

- (NSString*) ToString;

@end
