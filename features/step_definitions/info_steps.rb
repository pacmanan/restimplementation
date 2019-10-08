Given(/^A call is made to the InfoAPI with the politician ID$/) do |table|
  table.hashes.each do |value|
    @response = info_api.retrieve_politician value[:id]
  end
end

Then(/^then politician information will be returned$/) do |table|
  table.hashes.each do |value|
    info_api.verify_politician_details @response, 'id', value[:id]
  end
end

Given(/^A user calls the InfoAPI service$/) do
  @response = info_api.retrieve_lastest_politicians
end

Then(/^the latest (\d+) politicians are returned in decending order of the date that they were created$/) do |arg|
  info_api.verify_politicians_order @response
end


Given(/^a system has all the mandatory information$/) do
  #Do nothing
end

Then(/^a politician can be added to the data pool by providing the mandatory field$/) do |table|
  table.hashes.each do |value|
    @response = info_api.add_politician value[:name], value[:country], value[:yob], value[:position],value[:risk]
  end
end

And(/^the response generated contains generated ID for the entity and the fields$/) do
  info_api.verify_politician_added @response
end