//
//  Jogada.m
//  Truuuuco!
//
//  Created by Gabriel Ribeiro on 09/10/13.
//  Copyright (c) 2013 Mobirama. All rights reserved.
//

#import "Jogada.h"

@implementation Jogada

-(instancetype)initWithBaralho:(Baralho*)pBaralho;
{
    self = [super init];
    if (self) {
        baralho = pBaralho;
    }
    return self;
}



@end
