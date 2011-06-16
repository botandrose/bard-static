Rails.application.routes.draw do
  namespace "mockups", :module => :bard_static do
    root :to => "static#serve", :file_path => "index"
    match "/*file_path" => "static#serve"
  end
end
