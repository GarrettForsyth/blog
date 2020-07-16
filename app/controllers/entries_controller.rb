class EntriesController < ApplicationController
  def new
    @entry = Entry.new
    @entry.sections.build
  end

  def create
    @entry = Entry.new(entry_attributes)
    @entry.image.attach(params[:entry][:image])
    if @entry.save
      redirect_to @entry
    else
      render :new
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def index
    @entries = Entry.all
  end

  private

  def entry_attributes
    params.require(:entry).permit(
      :title,
      :abstract,
      :image,
      sections_attributes: %i[id content _destroy]
    )
  end
end
