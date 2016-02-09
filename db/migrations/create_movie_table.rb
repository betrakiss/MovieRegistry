require_relative '../../config/environment'

class CreateMovieTable < ActiveRecord::Migration

  def up
    create_table :movies do |t|
      t.belongs_to :user, index: true
      t.string  :title
      t.integer :year
      t.string :imdb_id
      t.string :seen_at
    end
    puts 'ran up method'
  end

  def down
    drop_table :movies
    puts 'ran down method'
  end

end

CreateMovieTable.migrate(ARGV[0])
