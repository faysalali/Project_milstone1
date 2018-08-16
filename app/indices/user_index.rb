ThinkingSphinx::Index.define :user, with: :active_record, delta: true do
  indexes :name, as: 'user_name'
  indexes email
  indexes status
  has role
end
