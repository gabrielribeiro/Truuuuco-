package truco;

public class Mao {
private Carta Vira;
    public AcaoEnum acaoJogador;
    public Carta cartaJogador;
    
    public AcaoEnum acaoOponente;
    public Carta cartaOponente;
    
    public JogadoresEnum vencedor;
    public boolean Empachou;
    
    public boolean TrucoPedido;
    
    public boolean repetir(){
        if(acaoJogador == AcaoEnum.CORRER || acaoOponente == AcaoEnum.CORRER) return false;
        
        if(acaoJogador == AcaoEnum.JOGAR && acaoOponente == AcaoEnum.JOGAR) return false;
        
        if(acaoJogador == AcaoEnum.TRUCAR && 
        (acaoOponente == AcaoEnum.ACEITAR 
        || acaoOponente == AcaoEnum.CORRER
        || acaoOponente == AcaoEnum.AUMENTAR)) return false;

        if(acaoOponente == AcaoEnum.TRUCAR && 
        (acaoJogador == AcaoEnum.ACEITAR 
        || acaoJogador == AcaoEnum.CORRER
        || acaoJogador == AcaoEnum.AUMENTAR)) return false;
        
        return true;
    }
        
    Mao(Carta vira){
        acaoJogador = acaoOponente = null;
        cartaJogador = cartaOponente = null;
        this.TrucoPedido = false;
        this.Vira = vira;
    }
    
    void addAcaoJogador(AcaoEnum acao, Carta carta) {
        this.acaoJogador = acao;
        this.cartaJogador = carta;
        
        if(acao == AcaoEnum.TRUCAR)
            this.TrucoPedido = true;
        if(acao == AcaoEnum.ACEITAR)
            this.TrucoPedido = false;
    }

    void addAcaoOponente(AcaoEnum acao, Carta carta) {
        this.acaoOponente = acao;
        this.cartaOponente = carta;
        
        if(acao == AcaoEnum.TRUCAR)
            this.TrucoPedido = true;
        if(acao == AcaoEnum.ACEITAR)
            this.TrucoPedido = false;
    }

    void verVencedor() {
	int pontosJogador;
        int pontosOponente;
	
        if(acaoJogador == AcaoEnum.CORRER){
            vencedor = JogadoresEnum.OPONENTE;
            return;
        }
        
        if(acaoOponente == AcaoEnum.CORRER){
            vencedor = JogadoresEnum.JOGADOR;
            return;
        }
        
	if((acaoJogador == AcaoEnum.JOGAR || acaoJogador == AcaoEnum.ACEITAR) && 
		(acaoOponente == AcaoEnum.JOGAR || acaoOponente == AcaoEnum.ACEITAR)){
		if(cartaJogador.valor.getValor() == this.Vira.valor.getValor() +1){
					pontosJogador = 10 +cartaJogador.naipe.getValor();
				}else{
					pontosJogador = cartaJogador.valor.getValor(); 
				}
		if(cartaOponente.valor.getValor() == this.Vira.valor.getValor() +1){
					pontosOponente =10 +cartaOponente.naipe.getValor();
				}else{
					pontosOponente = cartaOponente.valor.getValor(); 
				}
		
	if(pontosJogador > pontosOponente){
		vencedor = JogadoresEnum.JOGADOR;
	}else if(pontosJogador < pontosOponente)
		vencedor = JogadoresEnum.OPONENTE;
	}else{
		this.Empachou = true;
		vencedor = null;
	}
}
}