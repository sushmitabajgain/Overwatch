class WeekSerializer < ActiveModel::Serializer
  attributes :id, :posted_date
  
  def posted_date
    {
      date: self.object.created_at.in_time_zone("Kathmandu").strftime('%B %d, %Y'),
      time: self.object.created_at.in_time_zone("Kathmandu").strftime( '%I:%M%p')
    }
  end
end