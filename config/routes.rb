Rails.application.routes.draw do
  namespace "mockups", :module => :bard_static do
    root :to => "static#mockups", :file_path => "index"
    get "/*file_path" => "static#mockups"
  end
  root :to => "bard_static/static#static", :file_path => "index"
  get "*file_path" => "bard_static/static#static"
end
