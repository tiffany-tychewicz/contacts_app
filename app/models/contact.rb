class Contact < ApplicationRecord
  
  def friendly_created_at
    created_at.strftime("%Y.%m.%d")
  end

end
