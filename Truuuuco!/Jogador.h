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
    JogadorA,
    JogadorB,
    JogadorC,
    JogadorD
}JogadorEnum;

@interface Jogador : NSObject

@property (nonatomic,strong) NSMutableArray *cartas;
@property (nonatomic,assign) JogadorEnum tipo;

//-(AcaoEnum)getAcaoJogada:(Jogada*) jogada;
-(void)receberCartas:(Carta*)carta;

@end