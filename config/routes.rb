MyGadgets::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
    get "/sign_up" => "devise/registrations#new"
  end

  root 'dashboard#index'
end
