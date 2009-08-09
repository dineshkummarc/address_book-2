class Tweet < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    text       :string
    contact_id :integer
    timestamps
  end

  belongs_to :contact

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
