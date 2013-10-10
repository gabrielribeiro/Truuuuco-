//
//  Jogo.h
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "Jogada.h"
#include "Jogador.h"

@interface Jogo : NSObject

@property (nonatomic,assign) NSUInteger pontuacaoTimeA;
@property (nonatomic,assign) NSUInteger pontuacaoTimeB;
@property (nonatomic,assign) JogadorEnum proximoJogador;
@property (nonatomic,strong) Baralho *baralho;
@property (nonatomic,assign,getter = isFinalizado) bool finalizado;

-(void)atualizarPlacar:(Jogada*)jogada;
-(instancetype)initWithBaralho:(Baralho*)baralho;

@end
