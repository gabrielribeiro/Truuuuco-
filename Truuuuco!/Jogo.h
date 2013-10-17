//
//  Jogo.h
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Jogada.h"
#import "Jogador.h"
#import "AppDelegate.h"

@interface Jogo : NSObject

@property (nonatomic,strong) Baralho *baralho;
@property (nonatomic,assign) JogadorEnum proximoJogador;
@property (nonatomic,assign) int pontuacaoTimeA;
@property (nonatomic,assign) int pontuacaoTimeB;
@property (nonatomic,assign,getter = isFinalizado) BOOL finalizado;

-(void)atualizarPlacar:(Jogada*)jogada;

@end
