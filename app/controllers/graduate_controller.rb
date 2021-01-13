class GraduateController < ApplicationController
  before_action :logged_in_user, only: [:graduatepage]
  def graduatepage
  end
end
