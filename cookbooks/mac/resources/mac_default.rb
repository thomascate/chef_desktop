resource_name :mac_default
property :description, name_property: true
property :domain, String, identity: true
property :key, String, identity: true
property :value, [String, Integer, Float, true, false]

action :write do
  execute "#{description} - #{domain} - #{key}" do
    command "defaults write \"#{domain}\" \"#{key}\" #{type} #{value}"
    user 'davidechols'
    not_if "defaults read \"#{domain}\" \"#{key}\" | grep ^#{apple_value(value)}$"
  end
end

def apple_value(value)
  case value
  when true
    1
  when false
    0
  else
    value
  end
end

def type
  case value
  when Integer
    '-int'
  when String
    '-string'
  when Float
    '-float'
  when true, false
    '-boolean'
  end
end
