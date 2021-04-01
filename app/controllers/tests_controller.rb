class TestsController < ApplicationController
  
  def index
    
    #byebug
    # /tests?level=2&lang=ru
    # /tests?data%5Blevel%5D=2&data%5Blang%5D=ru
    
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    
    render  plain: result.join("\n")
    #render plain: 'All tests'
    
    
    #render html: '<h1>All tests</h1>'.html_safe
    
    #render json: {tests: [] }
    
    #render json: {tests: Test.all }
    
    #render inline: '<p>My favourite language is: <%= %[ybuR].reverse! %>!</p>'
    
    #render file: 'public/about.html', layout: false
  
  
    #head 204
    
    #head :no_content
    
    #render inline: '<%= console %>'
    
    # logger.info(self.object_id)
    # 
    # respond_to do |format|
    #   format.html { render plain: 'All tests' }
    #   format.json { render json: { tests: Test.all }}
    # end
  end
  
  
  def show
    
    #redirect_to root_path
    
    #redirect_to 'https://ya.ru'
  
  end
  
  def new

  end
  
  def create
    test = Test.create(test_params)
    
    render  plain: test.inspect
  end
  
  
  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    
    render  plain: result.join("\n")
  end
  private
  
  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
