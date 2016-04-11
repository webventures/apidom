module Apidom
	class Client

	  def self.generate_domain_name_secret(params)
	    begin
	      response = HTTParty.post build_url("/api/domains/generate-domain-name-secret"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	      response['data']
	    rescue => e
	      return e
	    end
	  end


	  def self.check_domain_availability(params)
	    begin
	      response = HTTParty.post build_url("/api/domains/check-domain-availability"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	      response['data']
	    rescue => e
	      return e
	    end
	  end

		def self.check_multiple_domain_availability(params)
	    begin
	      response = HTTParty.post build_url("/api/domains/check-multiple-domain-availability"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	    response['data']
	      rescue => e
	      return e
	    end
	  end		
	  
		def self.register_domain(params)
	    begin
	      response = HTTParty.post build_url("/api/domains/register"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	    response['data']
	      rescue => e
	      return e
	    end
	  end		

		def self.renew(params)
	    begin
	      response = HTTParty.post build_url("/api/domains/renew"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	    response['data']
	      rescue => e
	      return e
	    end
	  end		

		def self.transfer(params)
	    begin
	      response = HTTParty.post build_url("/api/domains/transfer"),
	        :body => params.to_json, :headers => { 'Content-Type' => 'application/json' } 
	    response['data']
	      rescue => e
	      return e
	    end
	  end		


		private 
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