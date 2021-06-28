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

generate-runtime:
	girtod --use-runtime-linker -i source/ -o source/generated

generate-compiletime:
	girtod -i source/ -o source/generated

clean:
	rm *.a
