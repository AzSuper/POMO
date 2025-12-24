#!/bin/bash

# Pomodoro Timer CLI
# A command-line Pomodoro timer with animations and notifications

# Colors for better UX
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Config file location
CONFIG_FILE="$HOME/.config/pomodoro-timer/config"
DATA_FILE="$HOME/.config/pomodoro-timer/tasks.dat"

# Create config directory if it doesn't exist
mkdir -p "$HOME/.config/pomodoro-timer"

# Function to clear screen and show header
show_header() {
    clear
    echo -e "${CYAN}${BOLD}"
    echo "╔═══════════════════════════════════════════════════════════╗"
    echo "║              POMODORO PRODUCTIVITY TIMER                  ║"
    echo "╚═══════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Function to load or create config
load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
    else
        # First time setup
        show_header
        echo -e "${YELLOW}First time setup!${NC}\n"
        
        read -p "What time do you start work? (HH:MM, 24h format): " START_TIME
        read -p "What time do you finish work? (HH:MM, 24h format): " END_TIME
        
        echo "START_TIME=\"$START_TIME\"" > "$CONFIG_FILE"
        echo "END_TIME=\"$END_TIME\"" >> "$CONFIG_FILE"
        
        echo -e "\n${GREEN}Configuration saved!${NC}"
        sleep 2
    fi
}

# Function to get tasks for the day
get_tasks() {
    show_header
    echo -e "${GREEN}What are your tasks for today?${NC}"
    echo -e "${BLUE}(Enter each task, press Enter after each. Type 'done' when finished)${NC}\n"
    
    TASKS=()
    TASK_POMODOROS=()
    TASK_DURATIONS=()
    
    while true; do
        read -p "Task ${#TASKS[@]}: " task
        if [ "$task" = "done" ]; then
            break
        fi
        if [ -z "$task" ]; then
            continue
        fi
        
        read -p "  How many pomodoros for this task? " pomodoros
        read -p "  Duration of each pomodoro (minutes)? " duration
        
        TASKS+=("$task")
        TASK_POMODOROS+=("$pomodoros")
        TASK_DURATIONS+=("$duration")
        echo ""
    done
}

# Cat animation frames
animate_cat() {
    local duration=$1
    local end_time=$((SECONDS + duration))
    local frame=0
    
    local cat_frames=(
        "  /\\_/\\  \n ( o.o ) \n  > ^ <  \n   ●   "
        "  /\\_/\\  \n ( o.o ) \n  > ^ <  \n  ●    "
        "  /\\_/\\  \n ( ^.^ ) \n  > ^ <  \n   ●   "
        "  /\\_/\\  \n ( o.o ) \n  > ^ <  \n    ●  "
    )
    
    while [ $SECONDS -lt $end_time ]; do
        local remaining=$((end_time - SECONDS))
        local mins=$((remaining / 60))
        local secs=$((remaining % 60))
        
        clear
        show_header
        echo -e "${MAGENTA}${BOLD}Current Task: $2${NC}\n"
        
        echo -e "${YELLOW}${cat_frames[$frame]}${NC}"
        echo ""
        echo -e "${GREEN}${BOLD}Time Remaining: $(printf "%02d:%02d" $mins $secs)${NC}"
        echo ""
        
        if [ $((${#TASKS[@]} - 1)) -gt $3 ]; then
            echo -e "${CYAN}Next Task: ${TASKS[$((3 + 1))]}${NC}"
        fi
        
        frame=$(( (frame + 1) % 4 ))
        sleep 1
    done
}

# Function to send notification
send_notification() {
    notify-send -u critical "Pomodoro Timer" "$1"
}

# Function to ask to continue
ask_continue() {
    local task_idx=$1
    local pomo_num=$2
    local total_pomos=$3
    
    show_header
    echo -e "${GREEN}${BOLD}✓ Pomodoro $pomo_num of $total_pomos completed!${NC}\n"
    
    if [ $pomo_num -lt $total_pomos ]; then
        read -p "Start next pomodoro? (y/n): " response
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}Session paused. Run the script again to continue.${NC}"
            exit 0
        fi
    else
        echo -e "${GREEN}${BOLD}Task completed!${NC}"
        sleep 2
    fi
}

# Main execution
main() {
    load_config
    get_tasks
    
    if [ ${#TASKS[@]} -eq 0 ]; then
        echo -e "${RED}No tasks entered. Exiting.${NC}"
        exit 1
    fi
    
    # Process each task
    for i in "${!TASKS[@]}"; do
        local task="${TASKS[$i]}"
        local num_pomos="${TASK_POMODOROS[$i]}"
        local duration="${TASK_DURATIONS[$i]}"
        
        show_header
        echo -e "${CYAN}${BOLD}Starting Task: $task${NC}"
        echo -e "${BLUE}$num_pomos pomodoros × $duration minutes${NC}\n"
        read -p "Press Enter to start..."
        
        # Run pomodoros for this task
        for pomo in $(seq 1 $num_pomos); do
            local duration_secs=$((duration * 60))
            
            animate_cat $duration_secs "$task" $i
            
            send_notification "Pomodoro $pomo of $num_pomos complete for: $task"
            ask_continue $i $pomo $num_pomos
        done
    done
    
    show_header
    echo -e "${GREEN}${BOLD}🎉 All tasks completed! Great work! 🎉${NC}\n"
    send_notification "All tasks completed! Great work!"
}

# Run the program
main
