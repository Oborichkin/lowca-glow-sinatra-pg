Sequel.seed(:development, :test) do
  def run
    dataset = DB[:applies]
    dataset.insert(:read => true, :invited => true, :job_id => 1, :geek_id => 2)
    dataset.insert(:read => false, :invited => false, :job_id => 2, :geek_id => 3)
    dataset.insert(:read => true, :invited => true, :job_id => 2, :geek_id => 4)
    dataset.insert(:read => true, :invited => false, :job_id => 1, :geek_id => 1)
    dataset.insert(:read => false, :invited => false, :job_id => 3, :geek_id => 1)
    dataset.insert(:read => false, :invited => false, :job_id => 5, :geek_id => 2)
  end
end
