class ExchangeRate < ApplicationRecord
  def self.get_rate(from_iso_code, to_iso_code)
    rate = find_by(from: from_iso_code, to: to_iso_code)
    rate&.rate
  end

  def self.add_rate(from_iso_code, to_iso_code, rate)
    exrate = find_or_initialize_by(from: from_iso_code, to: to_iso_code)
    exrate.rate = rate
    exrate.save!
  end

  def self.each_rate
    return find_each unless block_given?

    find_each do |rate|
      yield rate.from, rate.to, rate.rate
    end
  end
end