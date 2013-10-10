//
//  Jogada.h
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Baralho.h"
#import "Mao.h"

@interface Jogada : NSObject

@property (nonatomic,strong) Mao *maoAtual;

-(instancetype)initWithBaralho:(Baralho*)baralho;

@end
