namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Cadastra as moedas"
   task add_coins: :environment do
    show_spinner("cadastrando moedas") do
      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://images.ctfassets.net/ohcexbfyr6py/6ncFHBdtEFrtrXZrK6D0CG/8682659d1744caac1ed5d627fc58b779/btc_logo.png"
        },
      
        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1696501628"
        },
      
        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png"
        },
      
        {
          description: "Iota",
          acronym: "IOT",
          url_image: "https://cryptologos.cc/logos/iota-miota-logo.png"
        },
      
        {
          description: "ZCash",
          acronym: "ZEC",
          url_image: "https://www.coins.com.br/wp-content/uploads/2022/07/1437.png"
        }
      ]
      
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastro dos tipos de mineiração"
    task add_mining_types: :environment do
      show_spinner("Cadastrando tipos de mineração...") do
        mining_types = [
          {description: "Proof of Work", acronym: "PoW"},
          {description: "Proof of Stake", acronym: "PoS"},
          {description: "Proof of Capacity", acronym: "PoC"}
        ]

        mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
        end
      end
    end
  private

  def show_spinner(msg_start, msg_end = "Concluído!", &block)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
