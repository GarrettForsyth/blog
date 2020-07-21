class EntriesController < ApplicationController
  def new
    @entry = Entry.new
    @entry.sections.build
  end

  def create
    @entry = Entry.new(entry_attributes)
    @entry.image.attach(params[:entry][:image])

    # attach each section image
    entry_attributes[:sections_attributes].to_h.each_with_index do |(_k, v), i|
      section = @entry.sections[i]
      section&.image&.attach(v[:image])
    end

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
    @entries = Entry.paginate(page: params[:page])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_attributes)
      flash[:success] = 'Entry updated.'
      redirect_to @entry
    else
      render :edit
    end
  end

  def destroy
    Entry.find(params[:id]).destroy
    flash[:success] = 'Entry deleted.'
    redirect_to admin_path
  end

  private

  def entry_attributes
    params.require(:entry).permit(
      :title,
      :abstract,
      :image,
      sections_attributes: %i[id content image _destroy]
    )
  end
end
