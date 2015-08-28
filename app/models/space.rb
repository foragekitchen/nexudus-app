class Space < NexudusBase

  def get_resource(id)
    self.class.get("/spaces/resources/#{id}")
  end

  def resource_details(id)
    # We can only access the "Description", AND the "LinkedResources" data when calling a single Resource
    resource = get_resource(id)
    details = {:description => resource["Description"]}
    linked = resource["LinkedResources"].present? ? get_resource( resource["LinkedResources"].first ) : nil
    
    if linked.present?
      location = linked["Description"].include?("@") ? linked["Description"].split("@").last.split(",") : nil
      location.map!{ |ft| ResourceLocation.new.convert_from_feet_to_inches(ft) } if location.is_a?(Array)
      details.merge!({:location => location})
    end

    return details
  end

  def resources(type = "Prep Table", visible = true)
    results = self.class.get("/spaces/resources?Resource_Visible=#{visible}")["Records"]
    resources = []

    results.each do |r|
      next unless r["ResourceTypeName"] == type
      item = {
        :id => r["Id"], 
        :name => r["Name"], 
        :type => r["ResourceTypeName"]
      }
      item.merge!( resource_details(r["Id"]) )
      resources << item
    end
    
    return resources
  end

  def available_resources_by_day(day_of_week = Date.today.wday)
    # We have to figure out time-availability ourselves, since the 'ResourceTimeSlot_FromTime' only returns exact matches
    self.class.get("/spaces/resourcetimeslots?ResourceTimeSlot_DayOfWeek=#{day_of_week}")["Records"]
  end

  def available_resources_by_time(set, from_time = Time.now + 2.hours, to_time = Time.now + 6.hours)
    #from_time = from_time.strftime("%Y-%m-%dT%H:%M:%SZ") unless from_time.is_a?(String)
    #to_time = to_time.strftime("%Y-%m-%dT%H:%M:%SZ") unless to_time.is_a?(String)
    from_time = Time.parse(from_time) if from_time.is_a?(String)
    to_time = Time.parse(to_time) if to_time.is_a?(String)

    available = []
    set.each do |time_slot|
      # Get the time span, accounting for next day
      time_diff = Time.parse(time_slot["ToTime"]) - Time.parse(time_slot["FromTime"])
      # Now detach the time from the date -- THIS DEFAULTS TO TODAY
      slot_start = Time.parse(time_slot["FromTime"].split("T").last)
      slot_end = slot_start + time_diff
      available << time_slot if from_time.utc >= slot_start && to_time.utc <= slot_end
    end
    
    return available

  end

  def available_resources_by_day_and_time(day_of_week = Date.today.wday,from_time = Time.now + 2.hours, to_time = Time.now + 6.hours)
    results = available_resources_by_time(available_resources_by_day(day_of_week),from_time,to_time)
    return results.collect{|t| t["ResourceId"]}
  end

end