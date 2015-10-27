#!/bin/bash
ENGINE=${HOME}/battlelineaiengine
PLAYER1=${HOME}/player1
PLAYER2=${HOME}/player2
DEFAULT_PLAYER="/usr/bin/python2.7 ${ENGINE}/runStarterBot.py"

info () {
    echo "INFO: $1" | cut -c -80 | sed -e 's/\(.\{77\}\).\{3\}/\1.../'
}

# Read player 1 configuration
if [ -e ${PLAYER1}/run-command ]; then
    info "User Supplied Bot Detected for Player 1"
    PLAYER1_CMD="$(head -n 1 ${PLAYER1}/run-command)"
else
    info "Using Default Player for Player 1"
    PLAYER1_CMD=${DEFAULT_PLAYER}
fi

# Read player 2 configuration
if [ -e ${PLAYER2}/run-command ]; then
    info "User Supplied Bot Detected for Player 2"
    PLAYER2_CMD="$(head -n 1 ${PLAYER2}/run-command)"
else
    info "Using Default Player for Player 2"
    PLAYER2_CMD=${DEFAULT_PLAYER}
fi

# Run the game
info "Player 1 Command --> ${PLAYER1_CMD}"
info "Player 2 Command --> ${PLAYER1_CMD}"
info "Running Engine"
/usr/bin/python2.7 ${ENGINE}/Battleline.py "${PLAYER1_CMD}" "${PLAYER2_CMD}"

