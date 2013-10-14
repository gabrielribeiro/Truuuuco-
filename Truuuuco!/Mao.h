//
//  Mao.h
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 10/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carta.h"

typedef enum TimeEnum
{
    TimeA,
    TimeB
}TimeEnum;

@interface Mao : NSObject

@property (nonatomic,assign,getter = isEmpatado) bool empatado;

@property (nonatomic,strong) Carta *vira;

@property (nonatomic,strong) NSMutableDictionary *acoesDosJogadores;
@property (nonatomic,strong) NSMutableDictionary *cartasJogadas;

@property (nonatomic,assign,readonly,getter = definirVencedor) TimeEnum vencedor;

-(id) initWithVira:(Carta*)vira;

@end
