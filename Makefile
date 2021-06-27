all: generate-runtime, linker, glib, graphene, cairo, harfbuzz, pango, gio, gdkpixbuf, atk, gdk, rsvg, gsk, gtk, adw, gstreamer, sourceview, soup

all-compiletime: generate-compiletime, linker, glib, graphene, cairo, harfbuzz, pango, gio, gdkpixbuf, atk, gdk, rsvg, gsk, gtk, adw, gstreamer, sourceview, soup

linker:
	dub build gtk_d:linker

glib: linker
	dub build gtk_d:glib

graphene: linker, glib
	dub build gtk_d:graphene

cairo: linker, glib
	dub build gtk_d:cairo

harfbuzz: linker, glib
	dub build gtk_d:harfbuzz

pango: linker, glib, cairo, harfbuzz
	dub build gtk_d:pango

gio: linker, glib
	dub build gtk_d:gio

gdkpixbuf: linker, glib, gio
	dub build gtk_d:gdkpixbuf

atk: linker, glib
	dub build gtk_d:atk

gdk: linker, glib, cairo, gio, gdkpixbuf, pango
	dub build gtk_d:gdk

rsvg: linker, glib, cairo, gdkpixbuf
	dub build gtk_d:rsvg

gsk: linker, glib, cairo, graphene, gdk
	dub build gtk_d:gsk

gtk: linker, glib, gdk, graphene, gsk
	dub build gtk_d:gtk

adw: linker, gtk
	dub build gtk_d:adw

gstreamer: linker, glib
	dub build gtk_d:gstreamer

sourceview: linker, glib, gtk
	dub build gtk_d:sourceview

soup: linker, glib, gio
	dub build gtk_d:soup

generate: generate-runtime

.PHONY: generate-runtime
generate-runtime:
	girtod --use-runtime-linker -i source/ -o source/generated

generate-compiletime:
	girtod -i source/ -o source/generated

ddox:
	mkdir -p ddox/temp

	dmd -o- -D -X -Xfddox/docs.json -Ddddox/temp \
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

	rm -rf ddox/temp/*

	sed -i 's/"kind" : "module",/"kind" : "module", "comment" : " ",/g' ddox/docs.json

	sed -i 's/“/\&quot;/g' ddox/docs.json
	sed -i 's/”/\&quot;/g' ddox/docs.json
	sed -i 's/’/\&#39;/g' ddox/docs.json

	sed -i 's/<template\([^>]*\)>/\&lt;template\1\&gt;/g' ddox/docs.json
	sed -i 's/<\/template>/\&lt;\/template\&gt;/g' ddox/docs.json
	sed -i 's/<interface\([^>]*\)>/\&lt;interface\1\&gt;/g' ddox/docs.json
	sed -i 's/<\/interface>/\&lt;\/interface\&gt;/g' ddox/docs.json
	sed -i 's/<object\([^>]*\)>/\&lt;object\1\&gt;/g' ddox/docs.json
	sed -i 's/<\/object>/\&lt;\/object\&gt;/g' ddox/docs.json
	sed -i 's/<child\([^>]*\)>/\&lt;child\1\&gt;/g' ddox/docs.json
	sed -i 's/<\/child>/\&lt;\/child\&gt;/g' ddox/docs.json
	sed -i 's/<property\([^>]*\)>/\&lt;property\1\&gt;/g' ddox/docs.json
	sed -i 's/<\/property>/\&lt;\/property\&gt;/g' ddox/docs.json

	mv ddox/docs.json ddox/docs_utf8.json
	iconv -f utf8 -t ascii -c ddox/docs_utf8.json > ddox/docs.json

	dub run ddox -- filter ddox/docs.json --only-documented --min-protection Public

	dub run ddox -- generate-html --navigation-type=moduleTree ddox/docs.json ddox

make-docs:
	./makedocs.sh

clean:
	rm *.a
