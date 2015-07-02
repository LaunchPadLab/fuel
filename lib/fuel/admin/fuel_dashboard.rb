if defined?(ActiveAdmin)

  ActiveAdmin.register_page "Fuel Blog" do
    menu url: proc { fuel.admin_root_path }

  end
end