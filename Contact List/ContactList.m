
//
//  ContactList.m
//  Contact List
//
//  Created by Frank Chen on 2019-04-30.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _contactList = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void) addContact:(Contact *)newContact{
    [_contactList addObject:newContact];
}

-(NSString*)printList{
    NSString* returnString = @"";
    for (int i = 0; i < self.contactList.count; i++) {
        Contact* contact = self.contactList[i];
        NSString* contactName = contact.name;
        NSString* newContactString = [NSString stringWithFormat:@"%d:<%@>()", i+1, contactName];
        returnString = [returnString stringByAppendingString:newContactString];
        returnString = [returnString stringByAppendingString:@"\n"];
    }
    return returnString;
}

@end
