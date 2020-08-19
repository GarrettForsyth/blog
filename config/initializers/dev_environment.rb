unless Rails.env.production?
  ENV['HTTP_AUTH_NAME'] = 'admin'
  ENV['HTTP_AUTH_PASSWORD'] = 'password'
end
