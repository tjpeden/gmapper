Spec::Matchers.define :orderlessly_match do |original_string|
  regex = /[\?\|&]/
  match do |given_string|
    original_string.split(regex).sort == given_string.split(regex).sort
  end

  failure_message_for_should do |given_string|
    "expected\n#{given_string.split(regex).sort.inspect}\nto have the same parameters as\n#{original_string.split(regex).sort.inspect}"
  end

  failure_message_for_should_not do |given_string|
    "expected\n#{given_string.split(regex).sort.inspect}\nnot to have the same parameters as\n#{original_string.split(regex).sort.inspect}"
  end
end