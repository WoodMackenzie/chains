class RegistrationsController < ApplicationController
  def create
    flash[:danger] = 'Please contact the administrator to gain access to the system.'
    redirect_to root_path
  end
end