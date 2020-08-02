Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # API
  mount Base::API => '/'
  mount GrapeSwaggerRails::Engine => '/docs' if defined? GrapeSwaggerRails
end
