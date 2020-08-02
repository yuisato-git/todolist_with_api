require 'grape-swagger'

module Base
  class API < Grape::API
    # http://localhost/api/
    prefix 'api'
    mount V1::Root
  end
end
