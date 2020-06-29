class CreateRfis < ActiveRecord::Migration[6.0]
  def change
    create_table :rfis do |t|
      t.string :request_id
      t.string :requested_from
      t.string :nickname
      t.string :description
      t.string :suggestion
      t.string :primary_discipline
      t.boolean :is_urgent
      t.string :pm_contact
      t.string :status

      t.timestamps
    end
  end
end
