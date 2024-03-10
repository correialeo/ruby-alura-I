class JogoAdivinhacao
  def da_boas_vindas
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        "
    puts "        \\__|_|__/                              "
    puts
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    nome
  end

  def pede_dificuldade
    puts "\nQual o número da dificuldade que deseja?
(1 - MUITO FÁCIL, 2 - FÁCIL, 3 - MÉDIO, 4 - DIFÍCIL 5 - IMPOSSÍVEL)"
    puts "Escolha:"
    dificuldade = gets.to_i
  end

  def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
      maximo = 30
    when 2
      maximo = 60
    when 3
      maximo = 100
    when 4
      maximo = 150
    when 5
      maximo = 200
    else
      raise "Dificuldade inválida"
    end

    puts "\nEscolhendo um número secreto (1 - #{maximo})"
    numero_sorteado = rand(maximo) + 1
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
    numero_sorteado
  end

  def pede_um_numero(chutes, tentativa, limite_tentativas)
    puts "\nVocê terá #{limite_tentativas} tentativas!\nTentativa #{tentativa}/#{limite_tentativas}\nChutes até agora: #{chutes}"
    puts "\nEntre com o número"
    chute = gets.strip.to_i
    puts "Será que acertou? Você chutou #{chute}"
    chute
  end

  def verifica_acerto(numero_secreto, chute)
    acertou = numero_secreto == chute
    if acertou
      ganhou
      return true
    end

    maior = numero_secreto > chute
    if maior
      puts "O número secreto é maior! Tente novamente\n"
    else
      puts "O número secreto é menor! Tente novamente\n"
    end
    false
  end

  def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
  end

  def jogar(nome, dificuldade)
    numero_secreto = sorteia_numero_secreto dificuldade

    pontos_ate_agora = 1000

    limite_tentativas = 5
    chutes = []

    for tentativa in 1..limite_tentativas

      chute = pede_um_numero chutes, tentativa, limite_tentativas
      chutes << chute

      pontos_a_perder = (chute - numero_secreto).abs / 2.0
      pontos_ate_agora -= pontos_a_perder

      if verifica_acerto(numero_secreto, chute)
        break
      end
    end

    acertou = numero_secreto == chute
    if acertou
      puts "Você ganhou #{pontos_ate_agora} pontos"
    else
      puts "Você ganhou 0 pontos"
    end

    def quer_jogar?
      puts "Quer jogar novamente? (S/N)"
      quero_jogar = gets.strip
      quero_jogar.upcase == "S"
    end
  end

  jogo = JogoAdivinhacao.new
  nome = jogo.da_boas_vindas
  dificuldade = jogo.pede_dificuldade

  loop do
    jogo.jogar(nome, dificuldade)
    if !jogo.quer_jogar?
      break
    end
  end
end
