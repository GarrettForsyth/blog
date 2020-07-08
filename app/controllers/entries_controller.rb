class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_attributes)
    if @entry.save
      redirect_to @entry
    else
      render :new
    end
  end

  def show; end

  private

  def entry_attributes
    params.require(:entry).permit(
      :title,
      :abstract
    )
  end
end
