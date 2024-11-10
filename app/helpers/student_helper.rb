module StudentHelper
  def reason_display(count_hash)
    count_hash.collect do |reason, count|
      "#{reason}: #{count}"
    end.join(", ")
  end
end
