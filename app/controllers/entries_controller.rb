class EntriesController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_AUTH_NAME'],
                               password: ENV['HTTP_AUTH_PASSWORD'],
                               except: %i[index show]

  def new
    @entry = Entry.new
    @section = Section.new
    @entry.sections << @section
    @code_snippet = CodeSnippet.new
    @section.code_snippet = @code_snippet
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
      sections_attributes: [:id, :content, :image, :_destroy, code_snippet_attributes: %i[code language]]
    )
  end
end
