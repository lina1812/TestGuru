class TestsController < ApplicationController
  def index
    render json: { tests: Test.all }
  end

  def show
    test = test.find(params[:id])
    render json: test.to_json
  end

  def new; end

  def create
    test = Test.create(test_params)
    if test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

    render plain: result.join("\n")
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
