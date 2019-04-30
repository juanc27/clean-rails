class TestsController < ApplicationController
  before_action :test, only: %i[show update destroy]
  protect_from_forgery with: :null_session

  def index
    tests = Test.all
    render json: tests
  end

  def show
    # render json: @test
  end

  def update
    @test.update!(test_params)
    render json: @test.reload
  end

  def create
    test = Test.create!(test_params)
    render json: test.reload
  end

  def destroy
    @test.destroy
    render json: :ok
  end

  private

  def test
    @test ||= Test.find_by(id: params[:id])
  end

  def test_params
    params.permit(:first_name, :email, :last_name, :phone, :age)
  end
end
