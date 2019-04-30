//
//  ContactList.h
//  Contact List
//
//  Created by Frank Chen on 2019-04-30.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactList : NSObject

@property NSMutableArray* contactList;

-(NSString*) printList;

-(void) addContact:(Contact*) newContact;

@end

NS_ASSUME_NONNULL_END
