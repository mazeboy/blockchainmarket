//
//  CoinItem.m
//  BlockChainMarket
//
//  Created by Kory.Zhang on 2017/6/19.
//  Copyright © 2017年 Kory.Zhang. All rights reserved.
//

#import "CoinItem.h"

@implementation CoinItem : NSObject

- (NSString*) ToString{
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[_timestamp longValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                    
    NSString *dateStr = [dateFormatter stringFromDate:date];
    
    NSString* info = [NSString stringWithFormat:@"%@", _coinInfo.ToString];

    return info;
}

@end
