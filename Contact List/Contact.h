//
//  Contact.h
//  Contact List
//
//  Created by Frank Chen on 2019-04-30.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property NSString* name;
@property NSString* email;
@property NSMutableDictionary* phoneNumber;

@end

NS_ASSUME_NONNULL_END
