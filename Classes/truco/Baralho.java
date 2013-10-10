package truco;

import java.util.Random;

public class Baralho
{

    public Carta cartas[];
    private int cartaAtual;
    private final int number = 52;
    private Random embaralhador;

    //construtor que preenche as cartas
    public Baralho ()
    {
        ValorCartaEnum valores[] = { 
            ValorCartaEnum.TREIS ,
            ValorCartaEnum.DOIS ,
            ValorCartaEnum.AS ,
            ValorCartaEnum.REI ,
            ValorCartaEnum.VALETE ,
            ValorCartaEnum.DAMA ,
            ValorCartaEnum.SETE ,
            ValorCartaEnum.SEIS ,
            ValorCartaEnum.CINCO ,
            ValorCartaEnum.QUATRO
        };

        NaipeEnum naipes[] = { NaipeEnum.PAUS, NaipeEnum.COPAS, NaipeEnum.ESPADAS, NaipeEnum.OUROS }; 

        cartaAtual = 0;
        
        this.cartas = new Carta[40];

        embaralhador = new Random();
        
        int index = 0;
        for(int c = 0; c < valores.length; c++){
            for(int n = 0; n < naipes.length; n++){
                //System.out.println(valores[c] + " - " + naipes[n]);
                cartas[index] = new Carta(valores[c], naipes[n]);
                index = index + 1;
            }
        }
    }

    public void embaralhar()
    {
        cartaAtual = 0;

        for (int fis = 0; fis < cartas.length; fis++)
        {
            int sec = embaralhador.nextInt(cartas.length);

            Carta temp = cartas[fis];
            cartas[fis] = cartas[sec];
            cartas[sec] = temp;
        }
    }
	
    public Carta sacarCarta()
    {
        if(cartaAtual < cartas.length)
        {
            Carta cartaSaque = cartas[cartaAtual];
            cartaAtual++;
            return cartaSaque;
        } else {
            return null;
        }
    }
    
     public Carta viraCarta()
    {
           return sacarCarta();
    }
}   