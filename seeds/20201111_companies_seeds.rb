Sequel.seed(:development, :test) do
  def run
    dataset = DB[:companies]
    dataset.insert(:name => "Google", :location => "Seattle")
    dataset.insert(:name => "Protei", :location => "Saint-Petersburg")
    dataset.insert(:name => "SEMRush", :location => "Saint-Petersburg")
    dataset.insert(:name => "DataArt", :location => "Moscow")
  end
end
