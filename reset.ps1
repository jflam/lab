cmd /C "git pull origin master"
cmd /C "git checkout master"
$null | Set-Content stream.rb
cmd /C "git commit -a -m 'reset'"
cmd /C "git push"
