Heartwood::Engine.routes.draw do

  if Rails.env.development?
    get 'impersonate/:id' => 'impersonate#impersonate', as: :impersonate
  end

end
