class Apply < Sequel::Model
  def to_api
    {
        id: id,
        read: read,
        invited: invited,
        job_id: job_id,
        geek_id: geek_id,
    }
  end

  def self.read
    where(read: true)
  end

  def self.unread
    where(read: false)
  end
end
