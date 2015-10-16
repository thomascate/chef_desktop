resource_name :apm

action :install do
  execute "apm install #{name}"
end

action :uninstall do
  execute "apm uninstall #{name}"
end

action :upgrade do
  execute "apm upgrade #{name}"
end
