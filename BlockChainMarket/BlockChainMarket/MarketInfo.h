//
//  NSValue+MarketInfo.h
//  BlockChainMarket
//
//  Created by 张奎 on 2017/6/14.
//  Copyright © 2017年 张奎. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef struct MarketInfo {
    __unsafe_unretained NSString* id;
    __unsafe_unretained NSString* name;
}MarketInfo;

@interface NSValue (MarketInfo)

+ (instancetype)valueWithMarketInfo:(MarketInfo)value;
@property (readonly) MarketInfo marketInfoValue;

@end
