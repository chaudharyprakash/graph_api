require "grape-swagger"
module API  
  class Base < Grape::API
    mount API::Users
    mount API::Articles

		# http://localhost:3000/documentation
		# http://localhost:3000/api/kms
    add_swagger_documentation(
    info: {
      title: "Knowledge Managements System",
      description: "Ruby on Rails application build by passionate engineers. It supports knowledge managements and hepls to organize articles.",
      contact_name: "Prakash chaudhary",
      contact_email: "chaudharyprakash1992@gmail.com",
      contact_url: "http://localhost:3000/api/kms",
      terms_of_service_url: "http://localhost:3000/api/kms",
    },
      api_version: "v1",
      hide_documentation_path: true,
      mount_path: "/api/kms",
      basePath: "http://localhost:3000/documentation",
      hide_format: true
      )
  end
end  