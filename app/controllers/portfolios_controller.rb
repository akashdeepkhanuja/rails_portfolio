class PortfoliosController < ApplicationController

  layout 'portfolio'

	def index
		@portfolio_items = Portfolio.all
	end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

	def new
		@portfolio_item = Portfolio.new
    # instatiate 3 versio of portfolio item with technologies
    3.times { @portfolio_item.technologies.build }
	end

	def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
    
      else
        format.html { render :new, status: :unprocessable_entity }
        
      end
    end
  end


  def edit
    @portfolio_item = Portfolio.find(params[:id])


    
  end

  def show

  	@portfolio_item = Portfolio.find(params[:id])

  end

  def destroy

  	# performing the lookup

  	@portfolio_item = Portfolio.find(params[:id])

    # destroying the object
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Portfolio was successfully destroyed." }
    end
  end


  def update
  	@portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        
      end
    end

  end

  private 

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                      ) 
  end  

end
 