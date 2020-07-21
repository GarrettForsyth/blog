module NavigationHelper
  def path_to(page_name)
    case page_name
    when 'new entry'
      new_entry_path
    when 'show entry'
      entry_path(@entry)
    when 'index entry'
      entries_path
    when 'home'
      root_path
    when 'edit entry'
      edit_entry_path(@edit_entry)
    when 'admin'
      admin_path
    else
      raise Exception, "No page matches #{page_name}"
    end
  end

  def confirm_on_page(page_name)
    expect(page.current_path).to equal(path_to(page_name))
  end
end

World(NavigationHelper)
