class Group < ActiveRecord::Base
  has_and_belongs_to_many :users

  def add_user(user)
    if self.users.find_by({id:user.id})
      return user
    else
      self.users << user
    end
  end

  def remove_user(user)
    if self.users.find_by({id:user.id})
      self.users.delete(user.id)
    end
  end

end
