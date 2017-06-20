//
//  CoinInfo.h
//  BlockChainMarket
//
//  Created by 张奎 on 2017/6/19.
//  Copyright © 2017年 张奎. All rights reserved.
//

#ifndef CoinInfo_h
#define CoinInfo_h

#import <Foundation/Foundation.h>

@interface CoinInfo : NSObject

@property NSNumber* buy;
@property NSNumber* sell;
@property NSNumber* low;
@property NSNumber* high;
@property NSNumber* last;
@property NSNumber* vol;

- (NSString*) ToString;

@end

#endif /* CoinInfo_h */
