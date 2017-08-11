Rails.application.routes.draw do
  root 'epicenter#feed'

  get 'show_user' => 'epicenter#show_user'
# makes user following array include the selected user's id
  get 'now_following' => 'epicenter#now_following'
#removed id from following array
  get 'unfollow' => 'epicenter#unfollow'

  get 'following' => 'epicenter#following'
  get 'followers' => 'epicenter#followers'

  get 'tag_tweets' => 'epicenter#tag_tweets'

  get 'all_users' => 'epicenter#all_users'


  resources :tweets
  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
