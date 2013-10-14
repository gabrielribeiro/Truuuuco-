/* 
    public ValorJogadaEnum ValorJogada;
    
    public Mao MaoAtual;
    
    public Carta Vira;
    public Carta CartasMinhas[];
    public Carta CartasOponente[];
    
    public JogadoresEnum Pe;
    
    public JogadoresEnum Vencedor;
    public JogadoresEnum VencedoresMaos[];
    
    public Boolean TrucoPedido;
*/

-(void) Jogada:(Baralho)Baralho
{
	[baralho Embaralhar];

	NSArray *CartasMinhas = [Carta];
	NSArray *CartasOponente = [Carta];

	for(int i=0;i<3;i++)
	{
		self.CartasMinhas[i] = [Baralho SacarCarta];
	}
	for(int i=0;i<3;i++)
	{
		self.CartasOponente[i] = [Baralho SacarCarta];
	}

	self.Vira = [Baralho SacarCarta];

	self.ValorJogada = Hum;
	this.VencedoresMaos = [JogadoresEnum:3];
}

-(Mao)JogarMão:(JogadoresEnum)proximo withJogador:jogador withOponente:CartasOponente
{
	(Mao) *mao = [Mao self.Vira];
	do
	{
		if(proximo = [JogadoresEnum Jogador])
		{
			[AcaoEnum acao = [jogador Jogar]];
			[mao addAcaoJogador:acao, jogador.getCarta()] // Não manjei o suficiente dos paranaue para resolver isso.
			proximo = [JogadoresEnum Oponente];
		}else{
			[AcaoEnum acao = [oponente Jogar]];
			[map addAcaoOponente:acao, oponente.GetCarta()]// Esse é o sender da carta que o jogador lançou??
			proximo = [JogadoresEnum Jogador];
		}
	}while(self.mao.repetir);

	[mao VerVencedor];

	    for(int i=0; i<3; i++){
            if(VencedoresMaos[i] == nil){
                VencedoresMaos[i] = [mao Vencedor];
                break;
             }
        }

    return mao;
}