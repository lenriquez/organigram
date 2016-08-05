Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/v1' do
      scope '/diagram' do
	get '/' => 'diagram#index'
      end
    end
  end
end
