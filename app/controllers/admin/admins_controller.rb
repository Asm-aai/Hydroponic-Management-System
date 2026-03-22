class Admin::AdminsController < Admin::ApplicationController
  def my_page
    @admin = current_admin
  end
end
