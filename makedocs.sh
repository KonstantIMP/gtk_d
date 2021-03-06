#!/bin/bash

mkdir -p docs/temp

echo "MODULES =" > modules.ddoc
grep -h -e "^module" source/linker/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/adw/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/atk/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/cairo/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/gdk/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/gdkpixbuf/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/gio/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/glib/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/graphene/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/gsk/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/gstreamer/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/gtk/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/harfbuzz/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/pango/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/rsvg/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/shumate/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/soup/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc
grep -h -e "^module" source/generated/sourceview/* -r | sort -u | sed 's/;//' | sed 's/\r//' |  sed 's/module \(.*\)$/\t$(MODULE \1)/' >> modules.ddoc

dmd -o- -D -X -Xfdocs/docs.json -Dddocs/temp\
        source/generated/adw/adw/*.d source/generated/adw/adw/c/*.d \
        source/generated/atk/atk/*.d source/generated/atk/atk/c/*.d \
        source/generated/cairo/cairo/*.d source/generated/cairo/cairo/c/*.d \
        source/generated/gdk/gdk/*.d source/generated/gdk/gdk/c/*.d \
        source/generated/gdkpixbuf/gdkpixbuf/*.d source/generated/gdkpixbuf/gdkpixbuf/c/*.d \
        source/generated/gio/gio/*.d source/generated/gio/gio/c/*.d \
        source/generated/glib/glib/*.d source/generated/glib/glib/c/*.d \
        source/generated/glib/gobject/*.d source/generated/glib/gobject/c/*.d \
        source/generated/glib/gthread/*.d source/generated/glib/gthread/c/*.d \
        source/generated/graphene/graphene/*.d source/generated/graphene/graphene/c/*.d \
        source/generated/gsk/gsk/*.d source/generated/gsk/gsk/c/*.d \
        source/generated/gtk/gtk/*.d source/generated/gtk/gtk/c/*.d \
        source/generated/harfbuzz/harfbuzz/*.d source/generated/harfbuzz/harfbuzz/c/*.d \
        source/generated/pango/pango/*.d source/generated/pango/pango/c/*.d \
        source/generated/rsvg/rsvg/*.d source/generated/rsvg/rsvg/c/*.d \
        source/generated/soup/soup/*.d source/generated/soup/soup/c/*.d \
        source/generated/sourceview/sourceview/*.d source/generated/sourceview/sourceview/c/*.d \
        source/generated/shumate/shumate/*.d source/generated/shumate/shumate/c/*.d \
        source/linker/linker/*.d -op

#insert a fake comment for all modules so that docs doesn't filter out the modules
echo "Adding comment to modules"
sed -i 's/"kind" : "module",/"kind" : "module", "comment" : " ",/g' docs/docs.json

#Fix problem with unicode quotes by replacing them with ASCII quotes
echo Replacing unicode double and single quotes with ASCII equivalent
sed -i 's/???/\&quot;/g' docs/docs.json
sed -i 's/???/\&quot;/g' docs/docs.json
sed -i 's/???/\&#39;/g' docs/docs.json

#Escape tags that are causing problems.
echo Escaping gtk.Builder tags.
sed -i 's/<template\([^>]*\)>/\&lt;template\1\&gt;/g' docs/docs.json
sed -i 's/<\/template>/\&lt;\/template\&gt;/g' docs/docs.json
sed -i 's/<interface\([^>]*\)>/\&lt;interface\1\&gt;/g' docs/docs.json
sed -i 's/<\/interface>/\&lt;\/interface\&gt;/g' docs/docs.json
sed -i 's/<object\([^>]*\)>/\&lt;object\1\&gt;/g' docs/docs.json
sed -i 's/<\/object>/\&lt;\/object\&gt;/g' docs/docs.json
sed -i 's/<child\([^>]*\)>/\&lt;child\1\&gt;/g' docs/docs.json
sed -i 's/<\/child>/\&lt;\/child\&gt;/g' docs/docs.json
sed -i 's/<property\([^>]*\)>/\&lt;property\1\&gt;/g' docs/docs.json
sed -i 's/<\/property>/\&lt;\/property\&gt;/g' docs/docs.json

echo "Convert UTF-8 to ASCII for everything else"
mv docs/docs.json docs/docs_utf8.json
iconv -f utf8 -t ascii -c docs/docs_utf8.json > docs/docs.json

# Filter out everything except public members
dub run ddox -- filter docs/docs.json --only-documented --min-protection Public

# Use dub to run docs and generate offline docs documentation
dub run ddox -- generate-html --navigation-type=moduleTree docs/docs.json docs
