require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
  def test_index
    test1
    test2
    get tests_path
    assert_response :success
    body = JSON.parse(@response.body)
    assert_equal 2, body.count
    assert_equal 'test2@test.com', body[1]['email']
  end

  def test_show
    test1
    get test_path(id: test1.id, format: :json)
    assert_response :success
    body = JSON.parse(@response.body)
    assert_equal 'test1@test.com', body['email']
  end

  def test_create
    post tests_path, params: test1_params
    assert_response :success
    body = JSON.parse(@response.body)
    assert_equal 'test1@test.com', body['email']
  end

  def test_update
    test1
    put test_path(id: test1.id,
                  params: test1_params.merge(email: 'test3@test.com'))
    assert_response :success
    body = JSON.parse(@response.body)
    assert_equal 'test3@test.com', body['email']
  end

  def test_destroy
    test1
    delete test_path(id: test1.id)
    assert_response :success
    assert_equal 0, Test.all.count
  end

  private

  def test1
    @test1 ||= Test.create!(test1_params)
  end

  def test1_params
    {
      email: 'test1@test.com',
      first_name: 'Test1',
      last_name: 'Test1',
      phone: '123-456-7891',
      age: 21
    }
  end

  def test2
    @test2 ||= Test.create!(
      email: 'test2@test.com',
      first_name: 'Test2',
      last_name: 'Test2',
      phone: '123-456-7892',
      age: 22
    )
  end
end
