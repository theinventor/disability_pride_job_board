ActiveAdmin.register Job do


  form do |f|
    f.inputs do
      f.input :title 
      f.input :company
      f.input :location
      f.input :link
      f.input :details
      f.input :disabled
      f.input :expiration
      f.input :skill_level, :collection => ["Junior", "Intermediate", "Senior", "Other"], :prompt => "All"
      f.input :job_attributes, :as => :check_boxes
      f.input :pay_estimate
      f.input :contact_name 
      f.input :contact_email
      f.input :contact_title
      f.input :contact_phone
    end
    f.buttons
  end
end
