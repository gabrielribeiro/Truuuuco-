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

typedef enum TimeEnum
{
    TimeA,
    TimeB
}TimeEnum;

typedef enum AcaoEnum
{
    Jogar = 0,
    Trucar,
    Correr,
    Aceitar,
    Aumentar
}AcaoEnum;

@interface Jogador : NSObject

@property (nonatomic,strong) NSMutableArray *cartas;

-(AcaoEnum)getAcaoJogada:(Jogada *) jogada;
-(void)receberCartas:(NSArray*)cartas;

@end
