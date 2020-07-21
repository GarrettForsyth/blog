class StaticPagesController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_AUTH_NAME'],
                               password: ENV['HTTP_AUTH_PASSWORD'],
                               except: :home

  def home
    @recent_entries = Entry.recent_entries
  end

  def admin
    @entries = Entry.paginate(page: params[:page])
  end
end
