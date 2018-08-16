ThinkingSphinx::Index.define :project, with: :active_record, delta: true do
  indexes title, as: 'project_title'
  indexes status
end
