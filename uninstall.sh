KLIPPER_PATH_K1_DEFAULT="/usr/share/klipper"
KLIPPER_PATH=`curl localhost:7125/printer/info | jq -r .result.klipper_path`

function remove_autotune_extension {
    echo "[REMOVE] Removing files from Klipper..."

    if [ x"$KLIPPER_PATH" == x"null" ]; then
        KLIPPER_PATH=KLIPPER_PATH_K1_DEFAULT
        printf "Falling back to default klipper path: $KLIPPER_PATH\n"
    fi

    printf "Found klipper path: $KLIPPER_PATH\n"

    rm "${KLIPPER_PATH}/klippy/extras/autotune_tmc.py"
    rm "${KLIPPER_PATH}/klippy/extras/motor_constants.py"
    rm "${KLIPPER_PATH}/klippy/extras/motor_database.cfg"
}

printf "\n======================================\n"
echo "- Autotune TMC uninstall script -"
printf "======================================\n\n"

remove_autotune_extension