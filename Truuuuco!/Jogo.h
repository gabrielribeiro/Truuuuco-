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

@property (nonatomic,assign) NSUInteger pontuacaoTimeA;
@property (nonatomic,assign) NSUInteger pontuacaoTimeB;
@property (nonatomic,assign) JogadorEnum proximoJogador;
@property (nonatomic,strong) Baralho *baralho;
@property (nonatomic) BOOL isFinalizado;
@property (nonatomic) int pTimeA;
@property (nonatomic) int pTimeB;

@property(nonatomic, strong) Jogada *jogada;
@property(nonatomic, weak) AppDelegate *app;
@property(nonatomic) BOOL continueJogo;

-(void)placarGeral;
@end
