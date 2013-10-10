//
//  Mao.h
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 10/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carta.h"

typedef enum AcaoTruco{
    AcaoTrucoTrucar = 0,
    AcaoTrucoAceitar,
    AcaoTrucoFugir
}AcaoTruco;


typedef enum TimeEnum
{
    TimeA,
    TimeB
}TimeEnum;

@interface Mao : NSObject

@property (nonatomic,assign,getter = isTrucoPedido) bool trucoPedido;
@property (nonatomic,assign,getter = isEmpachado) bool empachado;

@property (nonatomic,strong) Carta *vira;

@property (nonatomic,strong) NSMutableDictionary *acoesDosJogadores;
@property (nonatomic,strong) NSMutableDictionary *cartasJogadas;

@property (nonatomic,assign,readonly,getter = definirVencedor) TimeEnum vencedor;

-(id) initWithVira:(Carta*)vira;
-(void)addAcao:(AcaoTruco)acao forJogador:(int)jogador withCarta:(Carta*)carta;

@end
