package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

file '/var/www/html/index.php' do
  path 'index.html'
  mode '0755'
  owner 'apache'
  group 'apache'
end
