collection @tags
attributes :id, :name, :created_at, :updated_at
node(:count) {|status| status.id}
