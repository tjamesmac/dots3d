# Passes local git branches and allows filtering before switching
gswc () {
  git branch | gum filter | xargs git switch
}

gpo () {
  push_check
  git push -u origin $(git rev-parse --abbrev-ref HEAD)
}

ts () {
  # Takes tmuxinator list output
  # splits it onto new lines
  # strips the tmuxinator projects part out
  # passes to gum filter/choose
  local projects=$(tmuxinator list)
  local split=${projects// /$'\n'}
  local project=$(echo $split | tail -n +3 | grep -v -e '^$' | gum choose)
  tmuxinator start $project
}

nr () {
  if [ ! -f './package.json' ]; then
      echo "package.json doesn't exist"
      return
  fi

  local command=$(jq -r ".scripts | keys[]" package.json | gum filter)
  npm run $command
}

# place this after nvm initialization!
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"
#
#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#
#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   # elif [ "$node_version" != "$(nvm version default)" ]; then
#   #   echo "Reverting to nvm default version"
#   #   nvm use default
#   fi
# }

push_check() {
  local checklist=()

  local formatted="Have formatted?"
  local linted="Have linted?"
  local tested="Have tested?"

  checklist+=("$formatted")
  checklist+=("$linted")
  checklist+=("$tested")

  function display_checklist() {
        echo "Your Checklist:"
        for ((i=1; i<=$#checklist; i++)); do
            echo "$i. ${checklist[$i]}"
        done

        for ((i=1; i<=$#checklist; i++)); do
            gum confirm "$i. ${checklist[$i]}:" && echo "${checklist[$i]} Nice!" || echo 'Get it done'
        done

        echo "Checklist completed. Proceed to push!"
    }

    display_checklist
}

day_check() {
  local checklist=()

  local calendar="Check calendar"
  local comms="Check email and slack"
  local auth="Setup auth"
  local note="Write note for previous day"

  checklist+=("$calendar")
  checklist+=("$comms")
  checklist+=("$auth")
  checklist+=("$note")

  function display_checklist() {
        echo "Your Checklist:"
        for ((i=1; i<=$#checklist; i++)); do
            echo "$i. ${checklist[$i]}"
        done

        for ((i=1; i<=$#checklist; i++)); do
            gum confirm "$i. ${checklist[$i]}:" && echo "${checklist[$i]} Nice!" || echo 'Get it done'
        done

        echo "Checklist completed. Ready to start the day!"
    }

    display_checklist
}

# Define the dumb_automation function
dumb_automation() {
    # List to hold the checklist questions
    local checklist=()

    # Function to add a question to the checklist
    function add_to_checklist() {
        echo "Enter the question to add to the checklist:"
        read -r question
        checklist+=("$question")
        echo "Question added to the checklist."
    }

    # Function to display the checklist and prompt for answers
    function display_checklist() {
        echo "Your Checklist:"
        for ((i=1; i<=$#checklist; i++)); do
            echo "$i. ${checklist[$i]}"
        done

        echo "Please answer each question with 'yes' or 'no':"
        for ((i=1; i<=$#checklist; i++)); do
            echo -n "$i. ${checklist[$i]}: "
            read -r answer
            while [[ "$answer" != "yes" && "$answer" != "no" ]]; do
                echo "Please answer 'yes' or 'no'."
                echo -n "$i. ${checklist[$i]}: "
                read -r answer
            done
        done

        echo "Checklist completed. Thanks!"
    }

    # Main script
    while true; do
        echo "Select an option:"
        echo "1. Add a question to the checklist"
        echo "2. Display the checklist and answer the questions"
        echo "3. Exit"

        read -r option

        case "$option" in
            1) add_to_checklist ;;
            2) display_checklist ;;
            3) break ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

# add-zsh-hook chpwd load-nvmrc
# load-nvmrc
