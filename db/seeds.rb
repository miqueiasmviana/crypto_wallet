# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cadastrando moedas..."

Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  url_image: "https://images.ctfassets.net/ohcexbfyr6py/6ncFHBdtEFrtrXZrK6D0CG/8682659d1744caac1ed5d627fc58b779/btc_logo.png"
)

Coin.create!(
  description: "Ethereum",
  acronym: "ETH",
  url_image: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1696501628"
)

Coin.create!(
  description: "Dash",
  acronym: "DASH",
  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png"
)

puts "Moedas cadastradas com sucesso"