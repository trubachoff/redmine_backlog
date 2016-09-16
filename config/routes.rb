# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :backlogs do
  get :backlogs, :to => 'backlogs#index'
  get '/backlogs/:id', :to => 'backlogs#show'

  collection do
    put :update_row_order
  end

end
