view = MasterWindow.add_tutorial_view(View)
view.loaded do |sender, args|
  path = "#{View.thought_stream.repository.local_directory}\\tutorial.rb"
  view.load(Formatter.new(View).render(path), "Problem Set")
end
