unless Rails.env.prodcution?
  ENV['HTTP_AUTH_NAME'] = 'admin'
  ENV['HTTP_AUTH_PASSWORD'] = 'password'
end
