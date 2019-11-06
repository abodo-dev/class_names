require "test_helper"
require 'class_names/view_helper'

class ClassNamesdef < Minitest::Test
  def test_a_keys_value_is_truthy
    hash = { truthy: true }
    result = ClassNames::Helper.new(hash).to_s
    assert(result == "truthy")
  end

  def test_a_keys_value_is_falsy
    hash = { falsy: false }
    result = ClassNames::Helper.new(hash).to_s

    assert(result == "")
  end

  def test_a_key_is_an_array_of_two_elements
    def when_value_is_truthy
      hash = { [:truthy, :falsy] => true }
      result = ClassNames::Helper.new(hash).to_s

      assert(result == "truthy")
    end

    def test_value_is_falsy
      hash = { [:truthy, :falsy] => false }
      result = ClassNames::Helper.new(hash).to_s

      assert(result == "falsy")
    end
  end

  def test_multiple_keys_are_given
    hash = {
        [:arr_truthy, :arr_falsy] => false,
        :str_truthy => true,
        :str_falsy => false
    }

    result = ClassNames::Helper.new(hash).to_s

    assert(result.match(/^\w+ \w+$/))
    assert(result.match(Regexp.union(["arr_falsy", "str_truthy"])))
    assert(!result.match(Regexp.union(["arr_truthy", "str_falsy"])))
  end

  def test_truthy_arguments_only
    result = ClassNames::Helper.new("truthy_1", "truthy_2").to_s
    assert(result == "truthy_1 truthy_2")
  end

  def test_mixed_arguments
    result = ClassNames::Helper.new("truthy_1", "truthy_2", falsy: false, truthy_3: true).to_s
    assert(result == "truthy_1 truthy_2 truthy_3")
  end

  def test_ignored_falsy_arguments
    result = ClassNames::Helper.new(nil, false, 'bar', 1, {baz: nil, foo: true}).to_s
    assert(result == "bar 1 foo", "got: #{result}")
  end
end
