

class Events::AttendanceController < ModuleController

  permit 'events_manage'
  
  component_info 'Events'
  
  cms_admin_paths 'content',
                "Content" => { :controller => '/content' }

  before_filter :get_opts

  def get_opts
      @opts = Events::AdminController.module_options
  end
                
                
  def index
    cms_page_path ['Content'],'Check-in'
    
    
  end
  
  def check_user
    @user = EndUser.find_by_membership_id(params[:member_id]) unless params[:member_id].blank?
    
    @time = Time.now
    
    
    @upcoming_event = EventsBooking.find(:first,:conditions => [ 'end_user_id = ? AND confirmed="1" AND events_events.event_on BETWEEN ? AND ?', @user.id,@time.at_midnight, @time.at_midnight + 1.days ],:joins => :events_event) if @user
  end
end
