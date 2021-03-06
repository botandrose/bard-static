Rails.application.routes.draw do
  namespace "mockups", module: "bard/static" do
    root to: "static#mockups", file_path: "index"
    get "/*file_path" => "static#mockups"
  end
  root to: "bard/static/static#static", file_path: "index", as: "bard_static_default_root"
  get "*file_path" => "bard/static/static#static", constraints: ->(request){
    lookup_context = ActionView::LookupContext.new([Rails.root.join("app/views/static")])
    lookup_context.exists?(request.path) || lookup_context.exists?(request.path + "/index")
  }
end

