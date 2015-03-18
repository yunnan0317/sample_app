require 'active_support/inflector'
guard :rspec, cmd: "bundle exec rspec", all_after_pass: false do

  watch('config/routes.rb')

  watch(%r{^app/controllers/(.+)_(controller)\/rb$}) do |m|
    ["spec/routing#{m[1]}_routing_spec.rb",
     "spec/#{m[2]}s#{m[1]}_#{m[2]}_spec.rb",
     "spec/acceptance/#{m[1]}_spec.rb",
     (m[1][/_pages/] ? "sepc/features/#{m[1]}_spec.rb" :
                       "sepc/features/#{m[1].singularize}_pages_spec.rb")] 
  end

  watch(%r{^app/views/(.+)/}) do |m|
    (m[1][/_pages/] ? "sepc/features/#{m[1]}_spec.rb" :
                      "sepc/features/#{m[1].singularize}_pages_spec.rb")
  end

  watch(%r{^app/controllers/sessions_controller\.rb$}) do |m|
    "spec/features/authentication_pages_spec.rb"
  end
  
end