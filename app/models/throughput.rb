class Throughput < ActiveRecord::Base

  belongs_to :processing_unit

  def metric_description
  end

  def amount_unit_description
  end

  def time_unit_description
  end

  def commodity_description
  end

  def unit_description
  end

end