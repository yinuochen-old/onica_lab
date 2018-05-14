package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content '
<!DOCTYPE html>

<html>
<head>
<title>Hello Onica</title>
<meta http-equiv=\"Content-Type\" content=\"text/html;charset=ISO-8859-1\">
</head>
<body>
<h1>Hello World <script>document.write(document.location.hostname)</script></h1>
</body>
</html>
'
  mode '0755'
  owner 'apache'
  group 'apache'
end
