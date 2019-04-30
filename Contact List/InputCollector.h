//
//  InputCollector.h
//  Contact List
//
//  Created by Frank Chen on 2019-04-30.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputCollector : NSObject

-(NSString*) inputForPrompt:(NSString*)promptString;

@property NSMutableArray* inputArray;

@end

NS_ASSUME_NONNULL_END
