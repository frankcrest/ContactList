//
//  InputCollector.m
//  Contact List
//
//  Created by Frank Chen on 2019-04-30.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

-(NSString*) inputForPrompt:(NSString*)promptString{
    NSLog(@"%@", promptString);
    char userInput[255];
    fgets(userInput, 255, stdin);
    NSString* userInputString = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
    NSString* userInputStringWithOutNewLine = [userInputString substringToIndex:[userInputString length] -1 ];
    return userInputStringWithOutNewLine;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _inputArray = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
