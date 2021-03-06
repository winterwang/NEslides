publishGitHub <- function (repo, username = getOption("github.user")) 
{
  if (!file.exists("libraries")) {
    message("Please set mode to selfcontained and run Slidify")
    message("This would place library files in the slide folder")
    message("making it self-contained")
    invisible(return(FALSE))
  }
  if (!file.exists(".git")) {
    init_repo()
  }
  if (!file.exists(".nojekyll")) {
    message("Adding .nojekyll to your repo...")
    file.create(".nojekyll")
  }
  message("Publishing deck to ", username, "/", repo)
  system("git add .")
  system("git commit -a -m \"publishing deck\"")
  system(sprintf("git push git@github.io:%s/%s gh-pages", 
                 username, repo))
  link = sprintf("http://%s.github.io/%s", username, repo)
  message("You can now view your slide deck at ", link)
  browseURL(link)
}