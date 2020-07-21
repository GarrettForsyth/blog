class StaticPagesController < ApplicationController
  def home
    @recent_entries = Entry.recent_entries
  end

  def admin
    @entries = Entry.all
  end
end
