ActiveAdmin.register User do
  permit_params :login

  filter :login

  index do
    selectable_column
    id_column
    column :login
    column :email
    actions
  end

  form do |f|
    f.inputs do
      f.input :login
      f.inputs :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end