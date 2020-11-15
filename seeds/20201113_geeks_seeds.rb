Sequel.seed(:development, :test) do
  def run
    dataset = DB[:geeks]
    dataset.insert(:name => "Ivan Ivanov", :stack => "RubyOnRails, JS", :resume => true)
    dataset.insert(:name => "Petr Petrov", :stack => "Node, JS", :resume => false)
    dataset.insert(:name => "Kirill Smirnov", :stack => "Php, HTML, CSS", :resume => true)
    dataset.insert(:name => "Pavel Oborin", :stack => "python, back-end", :resume => true)
    dataset.insert(:name => "Andrew Portnoy", :stack => "full stack", :resume => true)
  end
end
