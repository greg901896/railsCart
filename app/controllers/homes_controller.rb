class HomesController < ApplicationController
    include Pagy::Backend
    require 'rest-client'
    def index
      @pagy, @records = pagy(Product.all)
      @response = RestClient.post(
        'https://jsonplaceholder.typicode.com/posts',
        {
            "userId": 2000,
            "id": 1000,
            "title": "This is title",
            "body": "This is body"
        },
        { content_type: :json }

)
    end


    def t1
      session[:lan] = "?locale=en"
      redirect_to products_path(locale: 'en')
        
    end

    def t2
      session[:lan] = "?locale=zh-TW"
      redirect_to products_path(locale: 'zh-TW')
      @loc = session[:lan]
    end

    def t3
      session[:lan] = "?locale=ru"
      redirect_to products_path(locale: 'ru')
      @loc = session[:lan]
  end
end