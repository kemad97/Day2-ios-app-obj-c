//
//  FirstViewController.h
//  Day2 ios app
//
//  Created by Kerolos on 15/04/2025.
//

#import <UIKit/UIKit.h>
#import "MyDelegator.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController
@property  NSString *recieveString;
@property id<MyDelegator> delegate;


@end

NS_ASSUME_NONNULL_END
