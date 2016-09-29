module Apidom
	class Client

	  def self.get_expiry_date(params)
	    begin
	      response = HTTParty.post build_url("/api/domains/get-expiry-date"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	      return response
	    rescue => e
	      return e
	    end
	  end


	  def self.update_contact(params)
	    begin
	      response = HTTParty.post build_url("/api/domains/update-contact"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	      return response
	    rescue => e
	      return e
	    end
	  end


	  def self.generate_domain_name_secret(params)
	    begin
	      response = HTTParty.post build_url("/api/domains/generate-domain-name-secret"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	      return response
	    rescue => e
	      return e
	    end
	  end


	  def self.check_domain_availability(params)
	    begin
	      response = HTTParty.post build_url("/api/domains/check-domain-availability"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	      return response
	    rescue => e
	      return e
	    end
	  end

		def self.check_multiple_domain_availability(params)
	    begin
	      response = HTTParty.post build_url("/api/domains/check-multiple-domain-availability"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	    	return response
      rescue => e
	      return e
	    end
	  end		
	  
		def self.register_domain(params)
	    begin
	    	params = Client.check_testing_mode_params params
	      response = HTTParty.post build_url("/api/domains/register"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	    	return response
      rescue => e
	      return e
	    end
	  end		

		def self.renew(params)
	    begin
	    	params = Client.check_testing_mode_params params
	      response = HTTParty.post build_url("/api/domains/renew"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	    	return response
      rescue => e
	      return e
	    end
	  end		

		def self.transfer(params)
	    begin
	    	params = Client.check_testing_mode_params params
	      response = HTTParty.post build_url("/api/domains/transfer"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	    	return response
      rescue => e
	      return e
	    end
	  end		

		def self.get_contact(params)
	    begin
	    	params = Client.check_testing_mode_params params
	      response = HTTParty.post build_url("/api/domains/get-contact"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	    	return response
      rescue => e
	      return e
	    end
	  end		

		def self.get_server(params)
	    begin
	    	params = Client.check_testing_mode_params params
	      response = HTTParty.post build_url("/api/domains/name-servers"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	    	return response
      rescue => e
	      return e
	    end
	  end		


		def self.update_server(params)
	    begin
	    	params = Client.check_testing_mode_params params
	      response = HTTParty.post build_url("/api/domains/update-name-servers"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	    	return response
      rescue => e
	      return e
	    end
	  end		

		private 

		def self.check_testing_mode_params params
			return params unless Rails.env.test?
			params.merge!("testing_mode" => true)
		end

	  def self.sanitize_params params
	    array_params = []
	    params.each{|k,v| array_params << "#{k}=#{v}"}
	    return array_params.join("&")     
	  end

	  def self.build_url path, params=nil
	    "#{APIDOMS_URL}#{path}?global_app_code=#{GLOBAL_APP_CODE}&api_key=#{APIDOMS_API_KEY}&#{params}"
	  end

	end
end