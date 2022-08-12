class MasterController < ApplicationController
  def index
    @roles = Role.all.order("CREATED_AT ASC")
    @users = User.all.order("CREATED_AT ASC")
    @categories = Category.all.order("CREATED_AT ASC")
    @work_units = WorkUnit.all.order("CREATED_AT ASC")
  end
end
