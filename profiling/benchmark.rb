require("benchmark")
require("securerandom")
require("class_names/view_helper")
include ClassNames::ViewHelper

NUMBER_OF_CALLS = 50_000

def class_name
  SecureRandom.hex(4)
end

def true_or_false
  [true, false].sample
end

arrays = Enumerator.new { |y| y << [[class_name, class_name], true_or_false] }
strings = Enumerator.new { |y| y << [class_name, true_or_false] }

Benchmark.bm do |b|
  b.report("With 1 array and 1 string value") do
    NUMBER_OF_CALLS.times do
      class_names(Hash[arrays.take(1) + strings.take(1)])
    end
  end

  b.report("With 5 array and 5 string values") do
    NUMBER_OF_CALLS.times do
      class_names(Hash[arrays.take(5) + strings.take(5)])
    end
  end

  b.report("With 10 array values") do
    NUMBER_OF_CALLS.times do
      class_names(Hash[arrays.take(10)])
    end
  end

  b.report("With 10 string values") do
    NUMBER_OF_CALLS.times do
      class_names(Hash[strings.take(10)])
    end
  end
end