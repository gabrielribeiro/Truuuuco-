-(void)receberCartas:(Carta)cartasRecebidas
{
	cartasJogadas = cartasRecebidas;
	NSArray *pontosCartas;
}

-(AcaoEnum) jogar:(Jogada jogada)
{
	for(int i=0; i < 3; i ++)
	{
		if(cartasJogadas[i] != 1)
		{
			if(cartas[i].valor == self.jogada.Vira.valor +1)
			{
				//Naipe = 1, 2, 3, 4??
				//Também acho que tudo deveria ser property de uma classe hub.
				pontos += 10 +self.cartas[i].naipe;
				pontosCartas[i] = 10 + self.cartas[i].naipe;
			}
			else
			{
				pontos += self.cartas[i].valor;
				pontosCartas[i] = self.cartas[i].valor;
			}
		}
	}

	int acao;
	if(self.jogada.MaoAtual != null && self.jogada.MaoAtual.acaoJogador == [AcaoEnum TRUCAR])
	{
		acao = getAcaoTruco:jogada;
	}
	else
	{
		acao = getAcaoCarta:jogada;
	}

	switch(acao)
	{
		case 0:
		case 1:
		case 2:
			indexCarta = acao;
			return [AcaoEnum JOGAR];
		case 3:
			return [AcaoEnum TRUCAR];
		case 4:
			return [AcaoEnum CORRER];
		case 5:
			return [AcaoEnum AUMENTAR];
		case 6:
			return [AcaoEnum ACEITAR];
	}

	return [AcaoEnum JOGAR];
}

int getAcaoCarta:(Jogada jogada)
{
	int retorno = 0;

	if(pontos < 12) {return 4};

	if(self.jogada.VencedoresMaos[0] == nil && (self.jogada.MaoAtual == nil || self.jogada.MaoAtual.cartaJogador == null))
	{
		for(int i=0;i<3;i++)
		{
			retorno = i;
			if(pontosCartas[i] > pontosCartas[retorno] && pontosCartas[i] < 13 && cartasJogadas[i] != 1)
			{
				retorno = i;
			}
		}
	}
}