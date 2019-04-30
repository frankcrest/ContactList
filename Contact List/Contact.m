//
//  Contact.m
//  Contact List
//
//  Created by Frank Chen on 2019-04-30.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (instancetype)init
{
    self = [super init];
    if (self) {
        _phoneNumber = [[NSMutableDictionary alloc]init];
    }
    return self;
}

@end
