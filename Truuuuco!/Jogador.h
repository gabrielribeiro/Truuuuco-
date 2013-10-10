//
//  Jogador.h
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jogada.h"

typedef enum JogadorEnum
{
    JogadorA = 0,
    JogadorB,
    JogadorC,
    JogadorD
}JogadorEnum;

typedef enum AcaoJogador
{
    AcaoJogadorCorrer = 0,
    AcaoJogadorJogar,
    AcaoJogadorTrucar,
    AcaoJogadorAumentar,
    AcaoJogadorAceitar
}AcaoJogador;

@interface Jogador : NSObject

@property (nonatomic,strong) NSMutableArray *cartas;
@property (nonatomic,assign) JogadorEnum tipo;

-(AcaoJogador)getAcaoJogada:(Jogada*) jogada;
-(void)receberCarta:(Carta*)carta;

@end