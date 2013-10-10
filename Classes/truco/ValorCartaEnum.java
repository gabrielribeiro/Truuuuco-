package truco;

public enum ValorCartaEnum {  
    QUATRO(1),
    CINCO(2),
    SEIS(3),
    SETE(4),
    DAMA(5),
    VALETE(6),
    REI(7),
    AS(8), 
    DOIS(9), 
    TREIS(10);
    
    private int valor;

    private ValorCartaEnum(int pvalor) {
          this.valor = pvalor;
    }

    public int getValor() { return valor; }
}  