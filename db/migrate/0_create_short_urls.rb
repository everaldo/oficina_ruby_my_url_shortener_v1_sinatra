class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :url
      t.string :code

      t.timestamps
    end
  end
end

