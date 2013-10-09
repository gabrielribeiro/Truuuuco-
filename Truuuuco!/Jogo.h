//
//  Jogo.h
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Jogada;

@interface Jogo : NSObject

@property (nonatomic,assign) NSUInteger pontuacaoTimeA;
@property (nonatomic,assign) NSUInteger pontuacaoTimeB;
@property (nonatomic,assign,getter = isFinalizado) bool finalizado;

-(void)atualizarPlacar:(Jogada*)jogada;

@end