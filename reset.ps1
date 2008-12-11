cmd /C "git pull origin master"
cmd /C "git checkout master"
$null | Set-Content stream.rb
cmd /C "git add stream.rb"
cmd /C "git commit -m 'reset'"
cmd /C "git push"
cmd /C "git push steve"
