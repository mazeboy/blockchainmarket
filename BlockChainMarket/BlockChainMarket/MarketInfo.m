//
//  NSValue+MarketInfo.m
//  BlockChainMarket
//
//  Created by 张奎 on 2017/6/14.
//  Copyright © 2017年 张奎. All rights reserved.
//

#import "MarketInfo.h"

@implementation NSValue (MarketInfo)

+ (instancetype)valueWithMarketInfo:(MarketInfo)value
{
    return [self valueWithBytes:&value objCType:@encode(MarketInfo)];
}

- (MarketInfo) marketInfoValue
{
    MarketInfo value;
    [self getValue:&value];
    return value;
}

@end
