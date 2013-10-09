-(void)Mao:(NSString)vira
{
	acaoOponente = null
	acaoJogador = acaoOponente;
	cartaOponente = null;
	cartaJogador = cartaOponente;
	self.TrucoPedido = false;
	self.Vira = vira;
}

-(void)addAcaoJogador:(AcaoEnum)acao withCarta:(NSString)carta 
{
	self.acaoJogador = acao;
	self.cartaJogador = carta;
	if(acao == [AcaoEnum TRUCAR]){ self.TrucoPedido = TRUE; }
	if(acao == [AcaoEnum ACEITAR]) { self.TrucoPedido = FALSE; }
}

-(void)addAcaoOponente:(AcaoEnum acao) withCarta(NSString)carta
{
	self.acaoOponente = acao;
	self.cartaOponente = carta;

	if(acao == [AcaoEnum TRUCAR]) { self.TrucoPedido = TRUE; }
	if(acao == [AcaoEnum ACEITAR]) { self.TrucoPedido = FALSE; }
}

-(void) verVencedor
{
	int pontosJogador;
	int pontosOponente;

	if(acaoJogador == [AcaoEnum CORRER])
	{
		vencedor = [JogadoresEnum OPONENTE];
		return;
	}
	if(acaoOponente == [AcaoEnum CORRER])
	{
		vencedor = [JogadoresEnum JOGADOR];
		return;
	}

	if((acaoJogador == [AcaoEnum JOGAR] || acaoJogador == [AcaoEnum ACEITAR]) && (acaoOponente == [AcaoEnum JOGAR] || acaoOponente == [AcaoEnum ACEITAR]))
	{
		if(self.cartaJogador.valor == self.Vira.valor +1)
		{
			pontosJogador = 10 + self.cartaJogador.naipe;
		}
		else
		{
			pontosOponente = self.cartaOponente.valor;
		}

		if(self.cartaOponente.valor == self.Vira.valor +1)
		{
			pontosOponente =10 + self.cartaOponente.naipe;
		}
		else
		{
			pontosOponente = self.cartaOponente.valor;
		}
	}
	if(pontosJogador > pontosOponente)
	{
		vencedor = [JogadoresEnum JOGADOR];
	}
	else if(pontosJogador < pontosOponente)
	{
		vencedor = [JogadoresEnum OPONENTE];
	}
	else
	{
		self.Empachou = TRUE;
		vencedor = nil;
	}
}