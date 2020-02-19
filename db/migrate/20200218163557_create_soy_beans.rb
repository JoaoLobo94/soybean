class CreateSoyBeans < ActiveRecord::Migration[5.2]
  def change
    create_table :soy_beans do |t|
      t.string :class
      t.string :classification
      t.string :date
      t.string :plant_stand
      t.string :precip
      t.string :temp
      t.string :hail
      t.string :crop_hist
      t.string :area_damaged
      t.string :severity
      t.string :seed_tmt
      t.string :germination
      t.string :plant_growth
      t.string :leaves
      t.string :leafspots_halo
      t.string :leafspots_marg
      t.string :leafspot_size
      t.string :leaf_shread
      t.string :leaf_malf
      t.string :leaf_mild
      t.string :stem
      t.string :lodging
      t.string :stem_cankers
      t.string :canker_lesion
      t.string :fruiting_bodies
      t.string :external_decay
      t.string :mycelium
      t.string :int_discolor
      t.string :sclerotia
      t.string :fruit_pods
      t.string :fruit_spots
      t.string :seed
      t.string :mold_growth
      t.string :seed_discolor
      t.string :seed_size
      t.string :shriveling
      t.string :roots
      t.timestamps
    end
  end
end
