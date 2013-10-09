//
//  Mao.h
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "Carta.h"

typedef enum AcaoTruco{
    AcaoTrucoTrucar,
    AcaoTrucoAceitar,
    AcaoTrucoFugir
}AcaoTruco;

@interface Mao : NSObject

@property (nonatomic,strong) Carta *vira;
@property (nonatomic,assign,getter = isTrucoPedido) bool trucoPedido;

-(instancetype) initWithVira:(Carta*)vira;
-(void)addAcao:(AcaoTruco)acao forJogador:(NSObject*)jogador withCarta:(Carta*)carta;

@end
