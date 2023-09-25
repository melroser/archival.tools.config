# set download options / parameters
params='-S res,ext:mp4:m4a --recode mp4 --download-archive ~/Workspace/youtubedl/complete.list --restrict-filenames --windows-filenames --write-sub --sub-format "srt" --write-info-json --write-thumbnail --write-description --add-metadata --no-overwrites --ignore-errors --embed-subs --embed-metadata --embed-info-json --embed-thumbnail' #TODO: Change complete.list path here

# function to set autonumber and call youtube-dl
# $1    video / channel url
# $2    additional parameters
# $3    target directory name
# $4    season number (1-9)
function download {
  path="~/Movies/Youtube/${3}/Season 0${4}/" #TODO: Change default path here
  output="${path}%(channel)s_S0${4}E%(autonumber)s_%(title)s.%(ext)s"
  count=$(($(find "${path}" -type f | sort -r | head -1 | sed -E 's/.*S0.E0*([0-9]*).*/\1/') + 1))
  yt-dlp $1 $2 $params -o "${output}" --autonumber-start $count
}

# examples
#
#download https://youtu.be/qsHjEK9o-yo "--no-playlist" "Fireplace" "0"

#download https://www.youtube.com/c/LofiGirl "--playlist-reverse --playlist-start 1" "Lofi Girl" "0"

#download https://www.youtube.com/watch?v=PVJzibVS2YM&t=8256s   "Vader" "0"

#download https://www.youtube.com/c/FallofCivilizationsPodcast "--playlist-reverse --playlist-end 50" "Fall of Civilizations" "2"

# Channel 12
#download 
#https://www.youtube.com/c/FallofCivilizationsPodcast 
#"--playlist-reverse --playlist-end 50" "Fall of Civilizations" "2"

