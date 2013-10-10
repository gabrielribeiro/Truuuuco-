package truco;

public class Carta
{
    public ValorCartaEnum valor;
    public NaipeEnum naipe;

    //contrutor que receber os valores das cartas
    public Carta(ValorCartaEnum pValor, NaipeEnum pNaipe)
    {
        valor = pValor;
        naipe = pNaipe;
    }   
	
    public String toString()
    {
        return valor.toString() + " de " + naipe.toString();
    }
} 