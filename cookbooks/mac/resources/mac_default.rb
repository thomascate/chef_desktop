resource_name :mac_default
property :description, name_property: true
property :domain, String, identity: true
property :key, String, identity: true
property :user, String, identity: true, default: 'root'
property :value, [String, Integer, Float, true, false]

def to_f_i_s(v)
  ((float = Float(v)) && (float % 1.0 == 0) ? float.to_i : float)
rescue ArgumentError
  v
end

load_current_value do
  defaults = `defaults read \"#{domain}\" \"#{key}\"`
  defaults = defaults.chomp
  defaults = to_f_i_s(defaults)
  value defaults
end

action :write do
  converge_if_changed do
    execute "#{description} - #{domain} - #{key}" do
      command "defaults write \"#{domain}\" \"#{key}\" #{value}"
      user user
    end
  end
end
