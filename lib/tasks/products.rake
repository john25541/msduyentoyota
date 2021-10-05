namespace :products do
  require 'open-uri'

  def get_page
    @agent = Mechanize.new
    @array_products_url = []
  end

  def perform!
    get_page

    (1..4).each do |number|
      @agent.get "http://toyotasg.com.vn/mau-xe?page=#{number}&sort="

      page_models = @agent.page.search("#listProducts").search(".inner-item")

      page_models.each do |page_model|
        @array_products_url <<  page_model.search(".img").search('a').first.attributes['href'].value
      end
    end

    @array_products_url.each do |products_url|
      @products = {}
      @agent.get "http://toyotasg.com.vn/#{products_url}"

      @products[:slug] = products_url
      @products[:price] = @agent.page.search('.txt22').text.strip.gsub('.', '').to_i
      @products[:name] = @agent.page.search('.text').text.strip
      @products[:seats] = @agent.page.search('td.txt')[1].text
      @products[:body_type] = @agent.page.search('td.txt')[2].text
      @products[:fuel] = @agent.page.search('td.txt')[3].text
      @products[:doors] = 4
      @products[:origin] = @agent.page.search('td.txt').last.text

      @products[:car_model_id] = CarModel.where('name LIKE ?', "%#{@products[:name].split().first.capitalize}%").first.id

      product = Product.create(@products)

      list_image_url = @agent.page.search('.list-color > span.item')

      list_image_url.each do |image|
        image_url = image.attributes['data-img'].value.gsub('?w=555&h=230&mode=crop', '').gsub(" ", "%20")
        image_name = image.attributes['data-alt'].value
        attach_image = product.attachments.build(name: image_name)

        begin
          @downloaded_image = URI.parse("http://toyotasg.com.vn/#{image_url}").open
          attach_image.image.attach(io: @downloaded_image, filename: image_url.split("/").last.strip)
        rescue URI::InvalidURIError
          attach_image.delete
        end
      end

      if product.save
        product.update(colors: product.attachments.count)
        p 'ok'
      else
        p product.errors.full_messages
      end

    end
  end

  desc "inport data products from web"
  task import_data_on_web: :environment do
    Product.where.not(name:'YARIS 1.5G CVT').destroy_all
    perform!
  end

end
