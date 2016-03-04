class InitializerGenerator < Rails::Generators::Base
  def create_initializer_file
  	environment_string = []
  	initializer_string = []
  	file_paths = "config/environments/"
  	filenames = ["development.rb", "test.rb", "production.rb"]
		environment_string << "\nAPIDOMS_API_KEY=nil"
		environment_string << "APIDOMS_APP_CODE=nil" 
		environment_string << "APIDOMS_URL=nil" 

		filenames.each do |filename|
			File.open("#{file_paths}#{filename}", "a+"){|f| f << environment_string.join("\n")} if File.exists?("#{file_paths}#{filename}")
		end

		initializer_string << "API_KEY = APIDOMS_API_KEY"
		initializer_string << "GLOBAL_APP_CODE = APIDOMS_APP_CODE"
		create_file "config/initializers/apidoms.rb", "#{initializer_string.join("\n")}"
  end
end