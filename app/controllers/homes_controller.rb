class HomesController < ApplicationController
    include Pagy::Backend
    
    def index
        @pagy, @records = pagy(Product.all)
        
    end

    def t1
        session[:lan] = "?locale=en"
        redirect_to homes_path(locale: 'en')
        
    end

    def t2
        session[:lan] = "?locale=zh-TW"
        redirect_to homes_path(locale: 'zh-TW')
        @loc = session[:lan]
    end

    def t3
      session[:lan] = "?locale=ru"
      redirect_to homes_path(locale: 'ru')
      @loc = session[:lan]
  end
end