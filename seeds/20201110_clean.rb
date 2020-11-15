Sequel.seed(:development, :test) do
  def run
    puts "Cleanup"
    [:applies, :geeks, :jobs, :companies].each { |model| puts model; DB[model].truncate(:cascade => true, :restart => true) }
  end
end
