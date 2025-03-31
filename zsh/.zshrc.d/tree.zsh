function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L 3 -aC $@
}
