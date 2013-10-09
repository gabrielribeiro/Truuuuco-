package truco;

public class Oponente {
    
    private Carta cartas[] = new Carta[3];
    private int indexCarta;
    private int pontos;
    private int pontosCartas[];
    private int cartasJogadas[];
    
    public void receberCartas(Carta cartasRecebidas[]){
        System.arraycopy(cartasRecebidas, 0, cartas, 0, 3);
        cartasJogadas = new int[3];
        pontosCartas = new int[3];
    }
    
    public Carta getCarta(){
        return cartas[indexCarta];
    }
	
    public AcaoEnum jogar(Jogada jogada){
        //TITIES, MECHER AQUI
		
        //Trampar com jogada e jogada.jogada.MaoAtual.cartaJogador
        for(int i=0; i<3; i++){
                if(cartasJogadas[i] != 1){
                        if(cartas[i].valor.getValor() == jogada.Vira.valor.getValor() +1){
                                pontos += 10 +cartas[i].naipe.getValor();
                                pontosCartas[i] =10 +cartas[i].naipe.getValor();
                        }else{
                                pontos += cartas[i].valor.getValor(); 
                                pontosCartas[i] = cartas[i].valor.getValor(); 
                        }
                }
        }
        
        int acao;
        if (jogada.MaoAtual != null && jogada.MaoAtual.acaoJogador == AcaoEnum.TRUCAR) 
        {
            acao = getAcaoTruco(jogada);
        }else{
            acao = getAcaoCarta(jogada);
        }
           
		
		
        switch(acao){
            case 0:
            case 1:
            case 2:
                indexCarta = acao;
                return AcaoEnum.JOGAR;
            case 3:
                return AcaoEnum.TRUCAR;
            case 4:
                return AcaoEnum.CORRER;
			case 5: 
				return AcaoEnum.AUMENTAR;
			case 6:
				return AcaoEnum.ACEITAR;
        }
        
        return AcaoEnum.JOGAR;
    }
	
    public int  getAcaoCarta(Jogada jogada){
        int retorno = 0;
        
            // menor ou igual a 3 '7'
            if(pontos < 12) return 4;

            //Primeiro a jogar; Joga Maior
            if(jogada.VencedoresMaos[0] == null && (jogada.MaoAtual == null || jogada.MaoAtual.cartaJogador == null))
            {
                    for(int i=0; i<3; i++){
                                retorno = i;
                                if(pontosCartas[i] > pontosCartas[retorno] && pontosCartas[i] < 13 && cartasJogadas[i] != 1) retorno = i;
                    }
                    cartasJogadas[retorno] = 1;
                    return retorno;

            }

            if(jogada.VencedoresMaos[0] == JogadoresEnum.OPONENTE && jogada.VencedoresMaos[1] == null )
            {
                    if (pontos > 15) return 3;
                    for(int i=0; i<3; i++){
                            if (cartasJogadas[i] != 1){
                                    retorno = i;
                                    if(pontosCartas[i] > pontosCartas[retorno] && cartasJogadas[i] != 1) retorno = i;
                            }
                    }
                    cartasJogadas[retorno] = 1;
                    return retorno;
            }
            if(jogada.VencedoresMaos[0] == JogadoresEnum.JOGADOR && jogada.VencedoresMaos[1] == null )
            {
                    if (pontos > 21) return 3;
                    for(int i=0; i<3; i++){
                            if (cartasJogadas[i] != 1){
                                    retorno = i;
                                    if(pontosCartas[i] > pontosCartas[retorno] && cartasJogadas[i] != 1){ 
                                    cartasJogadas[retorno] = 1;
                                    retorno = i;
                                    }
                            }
                    }
                    if (pontosCartas[retorno] > jogada.MaoAtual.cartaJogador.valor.getValor()){
                            cartasJogadas[retorno] = 1;
                            return retorno;
                    }
                    for(int i=0; i<3; i++){
                            if (cartasJogadas[i] != 1){
                                    retorno = i;
                                    if(pontosCartas[i] < pontosCartas[retorno] && cartasJogadas[i] != 1) retorno = i;
                            }
                    }
                    cartasJogadas[retorno] = 1;
                    return retorno;
            }
            if(jogada.VencedoresMaos[0] == JogadoresEnum.JOGADOR && jogada.VencedoresMaos[1] == JogadoresEnum.OPONENTE )
            {
                    if (pontos > 9) return 3;

                    for(int i=0; i<3; i++){
                            if (cartasJogadas[i] != 1){
                                    retorno = i;
                                    if(pontosCartas[i] > pontosCartas[retorno] && cartasJogadas[i] != 1) retorno = i;
                            }
                    }

                    cartasJogadas[retorno] = 1;
                    return retorno;
            }

            if(jogada.VencedoresMaos[0] == JogadoresEnum.OPONENTE && jogada.VencedoresMaos[1] == JogadoresEnum.JOGADOR )
            {
                    if (pontos >= 11) return 3;

                    for(int i=0; i<3; i++){
                            if (cartasJogadas[i] != 1){
                                    retorno = i;
                                    if(pontosCartas[i] > pontosCartas[retorno] && cartasJogadas[i] != 1) retorno = i;
                            }
                    }
                    if (pontosCartas[retorno] > jogada.MaoAtual.cartaJogador.valor.getValor()) {
                            cartasJogadas[retorno] = 1;
                            return retorno;
                    }else{
                            for(int i=0; i<3; i++){
                                    if (cartasJogadas[i] != 1){
                                            retorno = i;
                                            if(pontosCartas[i] < pontosCartas[retorno] && cartasJogadas[i] != 1){
                                                    cartasJogadas[retorno] = 1;
                                                    retorno = i;
                                            }
                                    }
                            }
                    }
            }

            if(	jogada.MaoAtual.cartaJogador == null){
                    for(int i=0; i<3; i++){
                            if (cartasJogadas[i] != 1){
                                    retorno = i;
                                    if(pontosCartas[i] > pontosCartas[retorno] && cartasJogadas[i] != 1) retorno = i;
                            }
                    }
                    cartasJogadas[retorno] = 1;
                    return retorno;
            }
            if(	jogada.MaoAtual.cartaJogador != null){
                    for(int i=0; i<3; i++){
                            if (cartasJogadas[i] != 1){
                                    retorno = i;
                                    if(pontosCartas[i] > pontosCartas[retorno] && cartasJogadas[i] != 1) retorno = i;
                            }
                    }
                    if (pontosCartas[retorno] > jogada.MaoAtual.cartaJogador.valor.getValor()) {
                            cartasJogadas[retorno] = 1;
                            return retorno;
                    }else{
                            for(int i=0; i<3; i++){
                                    if (cartasJogadas[i] != 1){
                                            retorno = i;
                                            if(pontosCartas[i] < pontosCartas[retorno] && cartasJogadas[i] != 1){
                                                    cartasJogadas[retorno] = 1;
                                                    retorno = i;
                                            }
                                    }
                            }
                    }
            }
            
            return retorno;
    }
	
	public int  getAcaoTruco(Jogada jogada){
		 if(jogada.VencedoresMaos[0] == null)
		 {
			if(pontos > 21) return 5;
			if(pontos > 14) return 6;
			return 4;
		 }
		if(jogada.VencedoresMaos[0] == JogadoresEnum.JOGADOR && jogada.VencedoresMaos[1] == null)
		{
			if(pontos > 25) return 5;
			if(pontos > 20) return 6;
			return 4;
		}
		if(jogada.VencedoresMaos[0] == JogadoresEnum.OPONENTE && jogada.VencedoresMaos[1] == null)
		{
			if(pontos > 17) return 5;
			if(pontos > 10) return 6;
			return 4;
		}
		if(jogada.VencedoresMaos[0] == JogadoresEnum.OPONENTE && jogada.VencedoresMaos[1] == JogadoresEnum.JOGADOR)
		{
			if(pontos > 11) return 5;
			if(pontos > 10) return 6;
			return 4;
		}
		if(jogada.VencedoresMaos[0] == JogadoresEnum.JOGADOR && jogada.VencedoresMaos[1] == JogadoresEnum.OPONENTE)
		{
			if(pontos > 9) return 5;
			if(pontos > 8) return 6;
			return 4;
		}
                return 6;
	}
}

