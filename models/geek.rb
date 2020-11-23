class Geek < Sequel::Model
  def to_api
    {
      id: id,
      name: name,
      stack: stack,
      resume: resume,
    }
  end

  def self.geek_applies(gid)
    geek_applies = Apply.where(geek_id: gid) unless gid.nil?
    geek_applies.nil? ? [].to_json : collection_to_api(geek_applies)
  end
end
