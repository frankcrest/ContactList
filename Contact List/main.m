//
//  main.m
//  Contact List
//
//  Created by Frank Chen on 2019-04-30.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        InputCollector *myInputCollection = [[InputCollector alloc]init];
        ContactList *myContactList = [[ContactList alloc]init];
        
        NSLog(@"Choose from new,list,show,find,history or quit");
        while(YES){
            NSString* userInput = [myInputCollection inputForPrompt:@"Enter your prompt"];
            [myInputCollection.inputArray addObject:userInput];
            if ([userInput isEqualToString:@"quit"]) {
                exit(0);
            } else if ([userInput isEqualToString:@"new"]){
                Contact *myContact = [[Contact alloc]init];
                NSString* userName = [myInputCollection inputForPrompt:@"Enter your name"];
                [myContact setName:userName];
                NSString* email = [myInputCollection inputForPrompt:@"Enter your email"];
                [myContact setEmail:email];
                while (YES) {
                    NSString* phoneNumber = [myInputCollection inputForPrompt:@"Enter your phone number"];
                    NSString* phoneNumberLabel = [myInputCollection inputForPrompt:@"Enter a label for your phone number"];
                    myContact.phoneNumber[phoneNumberLabel] = phoneNumber;
                    NSString* userInput = [myInputCollection inputForPrompt:@"Do you want to enter another phone number? y/n"];
                    if ([userInput isEqualToString:@"y"]){
                        continue;
                    }else{
                        break;
                    }
                }
                
                BOOL emailExists = NO;
                for (Contact* contact in myContactList.contactList) {
                    NSLog(@"running array");
                    if ([contact.email isEqualToString:email]) {
                        NSLog(@"Contact with this email already exists, please use another email");
                        emailExists = YES;
                        break;
                    }
                }
                if (!emailExists) {
                    NSLog(@"saving contact");
                    [myContactList addContact:myContact];
                }
            }else if ([userInput isEqualToString:@"list"]){
                NSLog(@"%@", [myContactList printList]);
//                for (int i = 0; i < myContactList.contactList.count; i++) {
//                    Contact* contact = myContactList.contactList[i];
//                    NSString* contactName = contact.name;
//                    NSLog(@"%d:<%@>()", i+1, contactName);
//                }
            }else if([userInput isEqualToString:@"show"]){
                NSString* idToLookUp = [myInputCollection inputForPrompt:@"Please enter an id to look up, starting from 0"];
                NSInteger idValue = [idToLookUp integerValue];
                if (myContactList.contactList[idValue] != nil) {
                    Contact* contact = myContactList.contactList[idValue];
                    NSLog(@"%@",contact.name);
                    NSLog(@"%@", contact.email);
                } else{
                    NSLog(@"not found");
                }
            }else if ([userInput containsString:@"find"]){
                NSString* searchTerm = [userInput substringFromIndex:5];
                for (Contact* contact in myContactList.contactList) {
                    if ([contact.name containsString:searchTerm] || [contact.email containsString:searchTerm]) {
                        NSLog(@"%@", contact.name);
                        NSLog(@"%@", contact.email);
                    }
                }
            }else if ([userInput isEqualToString:@"history"]){
                if([myInputCollection.inputArray count] > 3){
                    NSUInteger beginningRange = [myInputCollection.inputArray count] - 4;
                    NSArray* lastThreeCommands = [myInputCollection.inputArray subarrayWithRange:NSMakeRange(beginningRange, [myInputCollection.inputArray count] - 1)];
                    for (NSString* command in lastThreeCommands) {
                        NSLog(@"%@", command);
                    }
                }else{
                    NSLog(@"You need to enter three or more prompts to use this command");
                }
            }
        }
    }
    return 0;
}
