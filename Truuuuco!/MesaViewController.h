//
//  MesaViewController.h
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 14/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface MesaViewController : UIViewController

@property (nonatomic,weak) IBOutlet UIImageView *jogadorACarta1, *jogadorACarta2, *jogadorACarta3;
@property (nonatomic,weak) IBOutlet UIImageView *jogadorBCarta1, *jogadorBCarta2, *jogadorBCarta3;
@property (nonatomic,weak) IBOutlet UIImageView *jogadorCCarta1, *jogadorCCarta2, *jogadorCCarta3;
@property (nonatomic,weak) IBOutlet UIImageView *jogadorDCarta1, *jogadorDCarta2, *jogadorDCarta3;

@property (nonatomic,weak) IBOutlet UIImageView *vira;

@property (nonatomic,strong) CMMotionManager *motionManager;

@end
