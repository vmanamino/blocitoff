class UserPolicy < ApplicationPolicy  
     
  def show?
    # a user can see own user view only
    scope.where(:id => record.id).exists? && (user.present? && (user.id == record.id || user.admin?)) 
  end
  
end