#!/bin/bash

dmd -o- -D -Dddocs docs/candydoc/modules.ddoc docs/candydoc/candy.ddoc \
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
		source/generated/gstreamer/gst/app/*.d source/generated/gstreamer/gst/app/c/*.d \
		source/generated/gstreamer/gst/base/*.d source/generated/gstreamer/gst/base/c/*.d \
		source/generated/gstreamer/gst/mpegts/*.d source/generated/gstreamer/gst/mpegts/c/*.d \
		source/generated/gstreamer/gstinterfaces/*.d source/generated/gstreamer/gstinterfaces/c/*.d \
		source/generated/gstreamer/gstreamer/*.d source/generated/gstreamer/gstreamer/c/*.d \
		source/generated/gtk/gtk/*.d source/generated/gtk/gtk/c/*.d \
		source/generated/harfbuzz/harfbuzz/*.d source/generated/harfbuzz/harfbuzz/c/*.d \
		source/generated/pango/pango/*.d source/generated/pango/pango/c/*.d \
		source/generated/rsvg/rsvg/*.d source/generated/rsvg/rsvg/c/*.d \
		source/generated/soup/soup/*.d source/generated/soup/soup/c/*.d \
		source/generated/sourceview/sourceview/*.d source/generated/sourceview/sourceview/c/*.d \
		source/linker/linker/*.d -op

cd docs

for file in */*/*/*/*.html;
do
	sed -i 's/<template\([^>]*\)>/\&lt;template\1\&gt;/g' "$file"
	sed -i 's/<\/template>/\&lt;\/template\&gt;/g' "$file"
	sed -i 's/<interface\([^>]*\)>/\&lt;interface\1\&gt;/g' "$file"
	sed -i 's/<\/interface>/\&lt;\/interface\&gt;/g' "$file"
	sed -i 's/<object\([^>]*\)>/\&lt;object\1\&gt;/g' "$file"
	sed -i 's/<\/object>/\&lt;\/object\&gt;/g' "$file"
	sed -i 's/<child\([^>]*\)>/\&lt;child\1\&gt;/g' "$file"
	sed -i 's/<\/child>/\&lt;\/child\&gt;/g' "$file"
	sed -i 's/<property\([^>]*\)>/\&lt;property\1\&gt;/g' "$file"
	sed -i 's/<\/property>/\&lt;\/property\&gt;/g' "$file"
done
