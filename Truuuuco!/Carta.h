//
//  Carta.h
//  Truuuuco!
//
//  Created by Guilherme Titschkoski on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum NaipeCarta
{
    Ouros = 11,
    Espadas = 12,
    Copas = 13,
    Paus = 14
    
}NaipeCarta;

typedef enum ValorCarta
{
    Quatro = 1,
    Cinco,
    Seis,
    Sete,
    Damas,
    Valete,
    Reis,
    As,
    Dois,
    Tres
}ValorCarta;

@interface Carta : NSObject

@property enum NaipeCarta naipe;

@property enum ValorCarta valor;

-(int)getPontuacao:(Carta *)vira;

-(id)initWithValor:(enum ValorCarta)valor andNaipe:(enum NaipeCarta)naipe;

@end
