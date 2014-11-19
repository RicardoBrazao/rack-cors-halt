require 'pry'
require 'rack/test'
require 'rspec'

describe Rack::Cors::Halt do
  include Rack::Test::Methods

  attr_accessor :halt_result

  def load_app(name)
    test = self
    Rack::Builder.new do
      eval File.read(File.dirname(__FILE__) + "/#{name}.ru")

      map('/valid') do
        run proc { |env|
          test.halt_result = env['X_RACK_CORS']
          [200, {'Content-Type' => 'text/html'}, ['success']]
        }
      end

      map('/not_to_everyone') do
        run proc { |env|
          test.halt_result = env['X_RACK_CORS']
          [200, {'Content-Type' => 'text/html'}, ['success']]
        }
      end
    end
  end

  let(:app) { load_app('test') }

  it 'should make a successfull request because CORS allows it from localhost:3000' do
    get '/valid', nil, {'HTTP_ORIGIN' => 'http://localhost:3000' }
    expect(halt_result).not_to be_nil
    expect(last_response.body).to eq('success')
  end

  it 'should make a successfull request because CORS allows it from localhost:9000' do
    get '/valid', nil, {'HTTP_ORIGIN' => 'http://localhost:9000' }
    expect(halt_result).not_to be_nil
    expect(last_response.body).to eq('success')
  end

  it "should fail the request because CORS blocks it from localhost:3000 and it doesn't hit the controller" do
    get '/not_to_everyone', nil, {'HTTP_ORIGIN' => 'http://localhost:3000' }
    expect(halt_result).to be_nil
    expect(JSON.parse(last_response.body)).to be_kind_of(Hash)
  end

  it "should make a successfull request because CORS allows it from yadayada:3000" do
    get '/not_to_everyone', nil, {'HTTP_ORIGIN' => 'http://yadayada:3000' }
    expect(halt_result).not_to be_nil
    expect(last_response.body).to eq('success')
  end
end