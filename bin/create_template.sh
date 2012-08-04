#!/bin/sh
TEMPLATE_DIR="templates/vm"

groupid=group1

echo -n "Creating opennebula templates:"
for template in $TEMPLATE_DIR/*.tmpl; do
        echo "  -> $template"
        result=`onetemplate create $template`
	id=`echo $result | cut -d: -f2`
	onetemplate chgrp $id $groupid
	onetemplate publish $id
done
