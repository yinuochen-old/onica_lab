require 'net/http'
require 'uri'

uri = URI.parse("http://169.254.169.254/latest/meta-data/local-hostname/")
response = Net::HTTP.get_response(uri)

package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content "
<!DOCTYPE html>

<html>
<head>
<title>Hello Onica</title>
<meta http-equiv=\"Content-Type\" content=\"text/html;charset=ISO-8859-1\">
</head>
<body>
<h1>Hello World #{node['hostname']}</h1>
</body>
</html>
"
  mode '0755'
  owner 'apache'
  group 'apache'
end
