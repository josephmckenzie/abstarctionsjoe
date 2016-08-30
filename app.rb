require 'sinatra'
require 'pony'

get '/' do

	erb :codesmells


end


get '/contact' do

		erb :contact
end


post '/contact' do
  name = params[:name]
  from = params[:email]
  to = "#{from}"                   
  comments = params[:message]
  subject= params[:subject]
  phone = params[:phone]

    Pony.mail(
        :to => to,
        :bcc => 'joseph.mckenzie@minedminds.org', 
        :from => 'joseph.mckenzie@minedminds.org',
        :subject => "Abstarctions Questions", 
        :content_type => 'text/html', 
        :body => erb(:email2,:layout=>false),
        :via => :smtp, 
        :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
           :user_name           => ENV['user_email'],
           :password            => ENV['user_email_pass'],
           :authentication       => :plain, 
           :domain               => "localhost" 
        }
      )

  erb :contact 
end 
