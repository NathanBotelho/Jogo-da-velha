programa{ 
	//bibliotecas
	inclua biblioteca Util --> ut
	//variaveis globais
	
	caracter jogo[3][3]
	inteiro i, j, linha, coluna

	funcao criandoMatriz(){ //Luis Status = ok
		para(i = 0; i < 3; i++){
			para(j = 0; j < 3; j++){
				jogo[i][j] = ' ' //criando a matriz vazia
			}
		}
	}
	
	funcao escrevendoMatriz(){ //Luis status: OK
		escreva("\n\n  0   1    2\n\n")
		para(i = 0; i < 3; i++){
			para(j = 0; j < 3; j++){
				escreva(" ", jogo[i][j])
				se(j < 2){
					escreva(" | ")
				}se(j == 2){
					escreva("  ", i)
				}
			}se(i < 2){
        escreva("\n -----------")
			}
      escreva("\n")
		}
	}

	funcao lerPosicao(inteiro jogador){ //Luis status: OK
		faca{
			faca{
				escreva("\nJogador ",jogador, " Digite a linha: ")
				leia(linha)
				escreva("Jogador ", jogador, " Digite a coluna: ")
				leia(coluna)	
			}enquanto(linha < 0 ou linha > 2 ou coluna < 0 ou coluna > 2)
		}enquanto(jogo[linha][coluna] != ' ')
	}

  ///atualizar jogador
	funcao inteiro atualizarJogador(inteiro jogador){ //Rafa: OK
    		se(jogador == 1){
      		jogador = 2 
    		}
    		senao{
      		jogador = 1
    		}
        retorne jogador
  	}


	//salvando uma jogada
	funcao inteiro saveJogada(inteiro jogador){//Rafa:OK
		se(jogador == 1){
			jogo[linha][coluna] = 'o'
		}
		senao{
			jogo[linha][coluna] = 'x'
		}
		retorne 1
	}

	 
	
	//Ganhou por linha?
	funcao inteiro ganhouPorLinha(caracter a){//Rafa:OK
		para(i = 0; i < 3; i++){
			se(jogo[i][0] == a e jogo[i][1] == a e jogo[i][2] == a){
				retorne 1 //Jogador ganhou 
			}
		}
		retorne 0 //Segue o jogo
	}

	//funcao para teste de vitoria por linha dos jogadores
	funcao inteiro ganhouPorLinhas(){//Matheus
		se(ganhouPorLinha('o') == 1)
		{
			retorne 1 //jogador 1 ganhou
		}
		se(ganhouPorLinha('x') == 1)
		{
			retorne 2 //jogador 2 ganhou
		}
		retorne 0 //ninguem ganhou
	}
	
	//Ganhou por coluna?
	funcao inteiro ganhouPorColuna(caracter b){//Mateus status: ok
			para(j = 0; j < 3; j++)
			{
			se(jogo[0][j] == b e jogo[1][j] == b e jogo[2][j] == b)
			{
				 retorne 1 //jogador ganhou
			}
		}
		retorne 0 //segue jogo
	}

	//Quem ganhou por coluna? Alguem ganhou?
	funcao inteiro ganhouPorColunas(){//Mateus status: ok
		se(ganhouPorColuna('o') == 1)
		{
			retorne 1 //jog 1 venceu
		}
		se(ganhouPorColuna('x') == 1)
		{
			retorne 2 //jog 2 venceu
		}
		retorne 0 //ninguem venceu
	}
	
	//Ganhou na Diagonal principal?
	funcao inteiro ganhouDPrincipal(caracter c){//Savio Status = ok
		se(jogo[0][0] == c e jogo[1][1] == c e jogo[2][2] == c)
		{
			retorne 1
		}
		retorne 0
	}

	//Quem ganhou na diagonal principal? Alguem ganhou?
	funcao inteiro ganhouDiPrincipal() {//Savio Status = ok
		se(ganhouDPrincipal('o') == 1)
		{
			retorne 1
		}
		se(ganhouDPrincipal('x') == 1)
		{
			retorne 2
      
		}
		retorne 0
	}
	
	//Ganhou na diagonal secundaria?
	funcao inteiro ganhouDSecundaria(caracter d){//Savio Status = ok
		se(jogo[0][2] == d e jogo[1][1] == d e jogo[2][0] == d)
		{
			retorne 1
		}
		retorne 0
	}

	//Quem ganhou na diagonal secundaria? alguem ganhou?
	funcao inteiro ganhouDiagSecundaria(){ //Luis Status: OK
		se(ganhouDSecundaria('o') == 1)
		{
			retorne 1
		}
		se(ganhouDSecundaria('x') == 1)
		{
			retorne 2
		}
		retorne 0
	}

	//funcao repetição
	funcao inteiro jogar(inteiro jogador, inteiro jogadas, inteiro ganhou){//Mateus status: ok
			faca{
				escrevendoMatriz()
				lerPosicao(jogador)
				
				//salvar jogadas e adicionar + 1 na qnt. de jogadas
				jogadas += saveJogada(jogador)
				jogador = atualizarJogador(jogador)

				//verificar vencedor por linhas
				ganhou += ganhouPorLinhas() // += para evitar resetar a variavel ganhou e perder a informa��es

				//verificar vencedor por colunas
				ganhou += ganhouPorColunas()
				
				//verificar vencedor na diagonal principal
				ganhou += ganhouDiPrincipal()
				
				//verificar vencedor na diagonal secund�ria
				ganhou += ganhouDiagSecundaria()
				
			}enquanto(ganhou == 0 e jogadas < 9)

        retorne ganhou

	}
	
	funcao inicio(){//Savio Status = ok
		//variaveis da main
		inteiro jogador, jogadas, op, ganhou
		
		faca{
			jogador = 1
			ganhou = 0
			jogadas = 0

			criandoMatriz()

			ganhou = jogar(jogador, jogadas, ganhou)

			escrevendoMatriz()

				se(ganhou == 1)
				{
				  escreva("\n\tPARABÉNS JOGADOR 1")
					
				}
				se(ganhou == 2)
				{
				  escreva("\n\tPARABÉNS JOGADOR 2")
				}
			
		      escreva("\nDigite 1 para jogar novamente: ")
			leia(op)
		}enquanto (op == 1)

  }
}