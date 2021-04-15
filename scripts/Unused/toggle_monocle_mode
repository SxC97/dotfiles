#! /usr/bin/env sh

# Get the current space and target space index
current_space="$(yabai -m query --spaces --space | jq -re '.index')"
target_space="${1:-${current_space}}"

# Get the target space id so this still works when the space is moved
target_space_id="$(yabai -m query --spaces \
	| jq -re ".[] | select(.index == ${target_space}) | .id")"

# Temporary script and lock-file per space in mononcle mode
script="${TMPDIR}/yabai_${USER}_monocle_mode_${target_space_id}"

# The lock file does not exit -- enable monocle mode
if ! [ -x "${script}" ]; then
	# Write the lock-file and make it executable
	cat > ${script} <<- EOM
		if yabai -m query --spaces --space \
			| jq -re ".id == ${target_space_id}" > /dev/null
		then
			yabai -m query --windows --space \
				| jq -re '.[] | select(."zoom-fullscreen" == 0) | .id' \
				| xargs -I{} yabai -m window {} --toggle zoom-fullscreen
		fi
	EOM
	chmod +x "${script}"

	# Special case: if we turn our current space into monocle mode, run the
	# script already
	if [ "${current_space}" = "${target_space}" ]
	then
		yabai -m query --windows --space \
			| jq -re '.[] | select(."zoom-fullscreen" == 0) | .id' \
			| xargs -I{} yabai -m window {} --toggle zoom-fullscreen
	fi

	# Listen to space_changed, window_created
	yabai -m signal --add event=space_changed action="${script}" \
		label="monocle_mode_${target_space_id}_space_changed"
	yabai -m signal --add event=window_created action="${script}" \
		label="monocle_mode_${target_space_id}_window_created"

	# If we re-enable monocle mode on a space before entering, but after having
	# disabled monocle mode, we need to avoid toggling zoom-fullscreen twice
	yabai -m signal --remove "monocle_mode_${target_space_id}_delay_disable" \
		> /dev/null

# The lock file does exist -- disable monocle mode
else
	# Write the lock-file
	cat > "${script}" <<- EOM
		if yabai -m query --spaces --space | jq -re ".id == ${target_space_id}"
		then
			yabai -m query --windows --space \
				| jq -re '.[] | select(."zoom-fullscreen" == 1) | .id' \
				| xargs -I{} yabai -m window {} --toggle zoom-fullscreen
			yabai -m signal --remove \
				"monocle_mode_${target_space_id}_delay_disable" > /dev/null
		fi
	EOM

	# Stop listening to space_changed, window_created
	yabai -m signal --remove "monocle_mode_${target_space_id}_space_changed"
	yabai -m signal --remove "monocle_mode_${target_space_id}_window_created"

	# If we disable monocle mode on the active space, run the script already
	if [ "${current_space}" = "${target_space}" ]; then
		yabai -m query --windows --space \
			| jq -re '.[] | select(."zoom-fullscreen" == 1) | .id' \
			| xargs -I{} yabai -m window {} --toggle zoom-fullscreen

	# Otherwise, delay running the script until we are on that space
	else
		yabai -m signal --add event=space_changed action="${script}" \
			label="monocle_mode_${target_space_id}_delay_disable"
	fi

	# Delete the lock-file
	rm -f "${script}"
fi
