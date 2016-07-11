#!/usr/bin/env sh
#
# name     : thumb.sh
# author   : Xu Xiaodong <xxdlhy@gmail.com>
# license  : GPL
# created  : 2016 Jul 03
# modified : 2016 Jul 03
#

for img in $@; do
    name=$(echo $img|cut -d'.' -f1)
    ext=$(echo $img|cut -d'.' -f2)
    convert -resize 400 $img ${name}.thumb.${ext}
    echo ">>> thumbnail $img..."
done

echo " * done"

exit 0
