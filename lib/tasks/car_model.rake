require 'open-uri'

ARRAY_CAR_MODEL = [
  {
    name: 'Yaris',
    lowest_price: 688000000,
    image_url: 'http://toyotasg.com.vn/data/news/1763/0fdxm1.png'
  },
  {
    name: 'Vios',
    lowest_price: 478000000,
    image_url: 'http://toyotasg.com.vn/data/news/5195/fqrpox.png'
  },
  {
    name: 'Corolla Altis',
    lowest_price: 733000000,
    image_url: 'http://toyotasg.com.vn/data/news/3063/a11bap.jpg'
  },
  {
    name: 'Camry',
    lowest_price: 1029000000,
    image_url: 'http://toyotasg.com.vn/data/news/4607/xzkgxa.png'
  },
  {
    name: 'Innova',
    lowest_price: 750000000,
    image_url: 'http://toyotasg.com.vn/data/news/1866/w5h2od.png'
  },
  {
    name: 'Fortuner',
    lowest_price: 995000000,
    image_url: 'http://toyotasg.com.vn/data/news/2010/3l23ya.png'
  },
  {
    name: 'Land Cruiser Prado',
    lowest_price: 2379000000,
    image_url: 'http://toyotasg.com.vn/data/news/1868/bwiwoy.png'
  },
  {
    name: 'Land Cruiser',
    lowest_price: 4030000000,
    image_url: 'http://toyotasg.com.vn/data/news/1869/o4cvco.png'
  },
  {
    name: 'Hilux',
    lowest_price: 628000000,
    image_url: 'http://toyotasg.com.vn/data/news/4915/uwwweu.png'
  },
  {
    name: 'Hiace',
    lowest_price: 1176000000,
    image_url: 'http://toyotasg.com.vn/data/news/1873/slz2n5.jpg'
  },
  {
    name: 'Avanza',
    lowest_price: 544000000,
    image_url: 'http://toyotasg.com.vn/data/news/4445/yibys3.png'
  },
  {
    name: 'Rush',
    lowest_price: 634000000,
    image_url: 'http://toyotasg.com.vn/data/news/4446/jy14s1.png'
  },
  {
    name: 'Wigo',
    lowest_price: 352000000,
    image_url: 'http://toyotasg.com.vn/data/news/4451/yv0hze.png'
  },
  {
    name: 'Alphard luxury',
    lowest_price: 4219000000,
    image_url: 'http://toyotasg.com.vn/data/news/4455/ypkjfc.png'
  },
  {
    name: 'Granvia',
    lowest_price: 3072000000,
    image_url: 'http://toyotasg.com.vn/data/news/5514/is1dyy.png'
  },
  {
    name: 'Corolla Cross',
    lowest_price: 720000000,
    image_url: 'http://toyotasg.com.vn/data/news/5522/pzur5d.jpg'
  },
]

namespace :car_model do
  desc "Import data from website toyota into the database"
  task import: :environment do
    CarModel.destroy_all
    ARRAY_CAR_MODEL.each do |object|
      import_car_model(object)
    end
  end

  def import_car_model(object)
    car_model = CarModel.create(name: object[:name], lowest_price: object[:lowest_price])
    downloaded_image = URI.parse(object[:image_url]).open
    car_model.image.attach(io: downloaded_image  , filename: "#{object[:name].downcase}#{object[:image_url][-4, 4]}")
  end
end
