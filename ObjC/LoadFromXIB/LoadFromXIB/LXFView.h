//
//  LXFView.h
//  LoadFromXIB
//
//  Created by Don Mag on 3/17/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface LXFView : UIView

@property (strong, nonatomic) IBOutlet UILabel *theLabel;


@property (assign, nonatomic) IBInspectable NSString *theText;

@end
