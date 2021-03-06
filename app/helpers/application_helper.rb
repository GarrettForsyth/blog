module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to(name, '#', id: 'add-section-btn', data: { id: id, fields: fields.gsub("\n", '') })
  end

  def link_to_add_nested_fields(name, f, association, nested_association)
    new_object = f.object.send(association).klass.new
    new_nested_object = new_object.class.reflect_on_association(nested_association).klass.new
    new_object.send("#{nested_association}=", new_nested_object)
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to(name, '#', id: 'add-section-btn', data: { id: id, fields: fields.gsub("\n", '') })
  end
end
