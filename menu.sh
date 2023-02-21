#!/bin/bash

# Function to display menu
show_menu() {
    echo "============================="
    echo "  MENU - Select an option:   "
    echo "============================="
    echo "1. Install Docker"
    echo "2. Add User to Docker Group"
    echo "3. Install Docker Compose"
    echo "4. Install ZFS"
    echo "5. Exit"
}

# Function to install Docker
install_docker() {
    echo "Installing Docker..."
    # add instructions to install Docker
}

# Function to add user to Docker group
add_user_to_docker_group() {
    echo "Adding User to Docker Group..."
    # add instructions to add user to Docker group
}

# Function to install Docker Compose
install_docker_compose() {
    echo "Installing Docker Compose..."
    # add instructions to install Docker Compose
}

# Function to install ZFS
install_zfs() {
    echo "Installing ZFS..."
    # add instructions to install ZFS
}

# Loop until the user selects option 5 to exit
while true
do
    show_menu
    read choice
    case $choice in
        1)
            install_docker
            ;;
        2)
            add_user_to_docker_group
            ;;
        3)
            install_docker_compose
            ;;
        4)
            install_zfs
            ;;
        5)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option. Please select a valid option."
            ;;
    esac
done
