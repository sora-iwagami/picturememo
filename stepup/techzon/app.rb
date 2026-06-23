require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'
require 'json'
require 'dotenv/load'
## 各種設定ファイル
require "./utils/permission.rb"
require "./utils/setting.rb"


enable :sessions

# app.rb呼び出し時に起動
before do
  
end

# トップページ表示
get '/' do
  erb :index
end

# 特定の商品ページ表示
get '/item/:id' do
  erb :product
end

# 購入ありがとうページ表示
get '/thanks' do
  erb :thanks
end

# 注文履歴の表示
get "/order/history" do
end

## -----admin-----
# admin側の処理
get '/admin' do
  protected!
  erb :'admin/dashboard'
end

# admin: 商品をすべて列挙するページ
get '/admin/products' do
  protected!
  erb :'admin/products'
end

# admin: 商品を追加する
post '/admin/post' do
  protected!
  # 商品の追加
  Item.create(
    name: params[:name],
    price: params[:price].to_i,
  )
  redirect '/admin/products'
end