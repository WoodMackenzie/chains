class ThroughputMetric < ActiveRecord::Base

  def self.throughput_metric_list
    array = Array.new
    ThroughputMetric.all.each do |throughput_metric|
      array.push(throughput_metric.description)
    end
    return array
  end

end
