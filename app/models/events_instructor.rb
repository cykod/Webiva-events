

class EventsInstructor < DomainModel

  belongs_to :events_repeats, :dependent => :nullify
  belongs_to :events_events, :dependent => :nullify

  belongs_to :end_user
  
  belongs_to :image_file, :class_name => 'DomainFile'
  
  has_many :upcoming_events, :class_name => 'EventsEvent', :conditions => 'event_on >= NOW()'
  
  validates_presence_of :name
end
