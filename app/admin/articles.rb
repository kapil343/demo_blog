ActiveAdmin.register Article do
  permit_params :title, :body, :slug, :user_id

  filter :user, as: :select, collection: User.with_role(:author).map { |u| [u.email, u.id] }

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :user, as: :select, collection: User.with_role(:author).map { |u| [u.email, u.id] }
    end
    f.actions
  end
end
