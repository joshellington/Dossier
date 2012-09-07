ActiveAdmin.register AdminUser do
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :password
    end
    f.buttons
  end
end