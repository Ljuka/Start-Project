#!/bin/sh

#  version_number.sh
#  onepower-ios
#
#  Created by Ljubo Maricevic on 11/07/2019.
#  Copyright © 2019 Ljubo Maricevic. All rights reserved.
git=$(sh /etc/profile; which git)
number_of_commits=$("$git" rev-list HEAD --count)
git_release_version=$("$git" describe --tags --always --abbrev=0)

target_plist="$TARGET_BUILD_DIR/$INFOPLIST_PATH"
dsym_plist="$DWARF_DSYM_FOLDER_PATH/$DWARF_DSYM_FILE_NAME/Contents/Info.plist"

for plist in "$target_plist" "$dsym_plist"; do
if [ -f "$plist" ]; then
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $number_of_commits" "$plist"
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString 0.$number_of_commits" "$plist"
fi
done
