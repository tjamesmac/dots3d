# Functions
# soon tm
# abcd() {
#   cd $(~/go/bin/abcd)
# }

# Passes local git branches and allows filtering before switching
gswc () {
  git branch | gum filter | xargs git switch
}
