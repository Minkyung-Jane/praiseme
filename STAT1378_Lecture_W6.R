devtools::install_github("Minkyung-Jane/praiseme")

usethis::use_git_config(user.name = "Minkyung-Jane",
                        user.email = "minkyung.park@students.mq.edu.au")
gitcreds::gitcreds_set()

gh::gh_whoami()
usethis::git_sitrep()
usethis::use_git()
