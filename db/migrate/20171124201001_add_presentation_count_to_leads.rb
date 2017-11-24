class AddPresentationCountToLeads < ActiveRecord::Migration[5.0]
  def change
    add_column :leads, :presentations_count, :integer
  end
end
