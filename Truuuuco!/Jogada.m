//
//  Jogada.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Jogada.h"

@interface Jogada() {
    Baralho *_baralho;
}

@end

@implementation Jogada

-(instancetype)initWithBaralho:(Baralho*)baralho;
{
    self = [super init];
    if (self) {
        _baralho = baralho;
    }
    return self;
}



@end
