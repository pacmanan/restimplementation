require 'rest-client'
require 'json'

module Pages
  class InfoAPI
    def retrieve_politician(id)
      response = RestClient.get("http://ec2-34-250-139-60.eu-west-1.compute.amazonaws.com/peps/#{id}",
                                content_type: 'application/json',
                                accept: 'application/json') { |r| r }

      raise "Expected to get 200 response code when a product is deleted but we got #{response.code}" unless response.code == 200
      response
    end

    def retrieve_lastest_politicians
      response = RestClient.get("http://ec2-34-250-139-60.eu-west-1.compute.amazonaws.com/peps",
                                content_type: 'application/json',
                                accept: 'application/json') { |r| r }

      raise "Expected to get 200 response code when a product is deleted but we got #{response.code}" unless response.code == 200
      response
    end

    def verify_politicians_order(payload)
      response_body = JSON.parse(payload)
      creation_date = []
      response_body.collect { |item| creation_date << item['createdAt'] }
      creation_date.each_with_index do |date, index|

        break if index +1 >= creation_date.size

        #Split createdAt Key into two parts, 1 stores the date, other stores the time
        date_a = creation_date[index].split('T')
        date_b = creation_date[index + 1].split('T')

        raise "Date: #{date_a[0]} at index: #{index} is smaller than date #{date_b[0]} at index:#{index + 1}" if date_a[0] < date_b[0]

        if (date_a[0] == date_b[0])
          raise "Time: #{date_a[1]} at index: #{index} is smaller than Time #{date_b[1]} at index:#{index + 1}" unless date_a[1] >= date_b[1]
        else
          raise "Time: #{date_a[0]} at index: #{index} is smaller than Time #{date_b[0]} at index:#{index + 1}" if date_a[0] < date_b[0]
        end
      end
    end

    def verify_politician_details(payload, field, expected_value)
      response_body = JSON.parse(payload)
      if (field == 'id')
        raise "Could not find the expected Politician using ID #{expected_value}" unless response_body['id'] == expected_value
      else
        puts 'Verification against this field is not currently supported'
      end
    end

    def add_politician(name, country, yob, position, risk)
      response = RestClient.post('http://ec2-34-250-139-60.eu-west-1.compute.amazonaws.com/peps',
                                 {
                                     "country": country,
                                     "name": name,
                                     "position": position,
                                     "risk": risk,
                                     "yob": yob
                                 }.to_json,
                                 accept: 'application/json',
                                 content_type: 'application/json') { |r| r }
      response_body = JSON.parse(response)
      response_body
    end

    def verify_politician_added(payload)
      raise "Failed to enter Politician to the data pool" if payload['id'].nil?
      puts "Politician with ID:#{payload['id']} has been added to the data pool"
    end
  end
end
