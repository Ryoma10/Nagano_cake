class Admin::ApplicationController < ApplicationController

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin_admin_customer
      new_admin_new_admin_session_path
    end
  end

end
