# README

Sample app - Ruby 2.5.1 & Rails 5.2.1 

Координаты Москвы взяты по габаритам МКАД (ориентировочно)

left_bottom = [55.559700, 37.326050]
right_top   = [55.913810, 37.891850]

Как кэшировать результаты так чтобы каждый 
раз не лезть в хранилище по тем же вводным

Можно сделать так
#app/controllers/api/v1/cash_machines_controller.rb
def search
  if stale? nearest_five_poi, public: true
    render json: nearest_five_poi
  end
end

touch tmp/caching-dev.txt

Далее в файле оставить как есть или изменить на другое хранилище
#config/environments/development.rb
config.cache_store = :memory_store


