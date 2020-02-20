# frozen_string_literal: true

require 'csv'
class SoyBeansController < ApplicationController
  def index
    import('/home/joao/Documents/code/tests/adcombi/soybean/storage/soybean-large.data')
  end

  def show; end

  def find; end

  def csv_cleaner; end

  def import(_file)
    key_values_hash = {
      classification: ['diaporthe-stem-canker', 'charcoal-rot', 'rhizoctonia-root-rot',
                       'phytophthora-rot', 'brown-stem-rot', 'powdery-mildew',
                       'downy-mildew', 'brown-spot', 'bacterial-blight',
                       'bacterial-pustule', 'purple-seed-stain', 'anthracnose',
                       'phyllosticta-leaf-spot', 'alternarialeaf-spot',
                       'frog-eye-leaf-spot', 'diaporthe-pod-&-stem-blight',
                       'cyst-nematode', '2-4-d-injury', 'herbicide-injury'],
      date: ['april', 'may', 'june', 'july', 'august', 'september', 'october', '?'],
      plant_stand: ['normal', 'lt-normal', '?'],
      precip: ['lt-norm,norm', 'gt-norm', '?'],
      temp: ['lt-norm,norm', 'gt-norm', '?'],
      hail: ['yes', 'no', '?'],
      crop_hist: ['diff-lst-year', 'same-lst-yr', 'same-lst-two-yrs', 'same-lst-sev-yrs', '?'],
      area_damaged: ['scattered', 'low-areas', 'upper-areas', 'whole-field', '?'],
      severity: ['minor', 'pot-severe', 'severe', '?'],
      seed_tmt: ['none', 'fungicide', 'other', '?'],
      germination: ['90-100%', '80-89%', 'lt-80%', '?'],
      plant_growth: ['norm', 'abnorm', '?'],
      leaves: %w[norm abnorm],
      leafspots_halo: ['absent', 'yellow-halos', 'no-yellow-halos', '?'],
      leafspots_marg: ['tw-s-marg', 'no-w-s-marg', 'dna', '?'],
      leafspot_size: ['lt-1/8', 'gt-1/8', 'dna', '?'],
      leaf_shread: ['absent', 'present', '?'],
      leaf_malf: ['absent', 'present', '?'],
      leaf_mild: ['absent', 'upper-surf', 'lower-surf', '?'],
      stem: ['norm', 'abnorm', '?'],
      lodging: ['yes', 'no', '?'],
      stem_cankers: ['absent', 'below-soil', 'above-soil', 'above-sec-nde', '?'],
      canker_lesion: ['dna', 'brown', 'dk-brown-blk', 'tan', '?'],
      fruiting_bodies: ['absent', 'present', '?'],
      external_decay: ['absent', 'firm-and-dry', 'watery', '?'],
      mycelium: ['absent', 'present', '?'],
      int_discolor: ['none', 'brown', 'black', '?'],
      sclerotia: ['absent', 'present', '?'],
      fruit_pods: ['norm', 'diseased', 'few-present', 'dna', '?'],
      fruit_spots: ['absent', 'colored', 'brown-w/blk-specks', 'distort', 'dna', '?'],
      seed: ['norm', 'abnorm', '?'],
      mold_growth: ['absent', 'present', '?'],
      seed_discolor: ['absent', 'present', '?'],
      seed_size: ['norm', 'lt-norm', '?'],
      shriveling: ['absent', 'present', '?'],
      roots: ['norm', 'rotted', 'galls-cysts', '?']
    }

    CSV.parse(File.read('/home/joao/Documents/code/tests/adcombi/soybean/storage/soybean-large.data'), headers: false, converters: :numeric) do |soy|
      data_dump = {
        classification: soy[0],
        date: soy[1],
        plant_stand: soy[2],
        precip: soy[3],
        temp: soy[4],
        hail: soy[5],
        crop_hist: soy[6],
        area_damaged: soy[7],
        severity: soy[8],
        seed_tmt: soy[9],
        germination: soy[10],
        plant_growth: soy[11],
        leaves: soy[12],
        leafspots_halo: soy[13],
        leafspots_marg: soy[14],
        leafspot_size: soy[15],
        leaf_shread: soy[16],
        leaf_malf: soy[17],
        leaf_mild: soy[18],
        stem: soy[19],
        lodging: soy[20],
        stem_cankers: soy[21],
        canker_lesion: soy[22],
        fruiting_bodies: soy[23],
        external_decay: soy[24],
        mycelium: soy[25],
        int_discolor: soy[26],
        sclerotia: soy[27],
        fruit_pods: soy[28],
        fruit_spots: soy[29],
        seed: soy[30],
        mold_growth: soy[31],
        seed_discolor: soy[32],
        seed_size: soy[33],
        shriveling: soy[34],
        roots: soy[35]
      }

      corrected_data_dump = data_dump.each do |k, v|
        key_values_hash.each do |k1, _v1|
          if v.is_a?(Integer)
            data_dump[k] = key_values_hash[k1][v - 1] if k == k1
          end
        end
      end

      SoyBean.create!(corrected_data_dump)
    end
  end

  private

  def soy_beans_params
    params.permit(:classification,
                  :date,
                  :plant_stand,
                  :precip,
                  :temp,
                  :hail,
                  :crop_hist,
                  :area_damaged,
                  :severity,
                  :seed_tmt,
                  :germination,
                  :plant_growth,
                  :leaves,
                  :leafspots_halo,
                  :leafspots_marg,
                  :leafspot_size,
                  :leaf_shread,
                  :leaf_malf,
                  :leaf_mild,
                  :stem,
                  :lodging,
                  :stem_cankers,
                  :canker_lesion,
                  :fruiting_bodies,
                  :external_decay,
                  :mycelium,
                  :int_discolor,
                  :sclerotia,
                  :fruit_spots,
                  :mold_growth,
                  :seed_size,
                  :shriveling,
                  :roots)
 end
end
