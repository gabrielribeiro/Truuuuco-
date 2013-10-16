//
//  AppDelegate.h
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Jogada.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) Jogada *jogada;

@property (nonatomic) int vencedorMao1;
@property (nonatomic) int vencedorMao2;
@property (nonatomic) int vencedorMao3;

@end
