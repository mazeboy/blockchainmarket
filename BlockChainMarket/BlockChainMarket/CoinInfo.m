//
//  CoinInfo.m
//  BlockChainMarket
//
//  Created by 张奎 on 2017/6/19.
//  Copyright © 2017年 张奎. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoinInfo.h"

@implementation CoinInfo : NSObject

- (NSString*) ToString {
    NSString* info = [NSString stringWithFormat:@"last:%@,buy:%@,sell:%@,high:%@,low:%@,vol:%@",self.last,self.buy,self.sell,self.high,self.low,self.vol];
    
    return info;
}

@end
