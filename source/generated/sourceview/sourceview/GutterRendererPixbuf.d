module sourceview.GutterRendererPixbuf;

private import gdk.PaintableIF;
private import gdkpixbuf.Pixbuf;
private import gio.IconIF;
private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import sourceview.GutterRenderer;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class GutterRendererPixbuf : GutterRenderer
{
	/** the main Gtk struct */
	protected GtkSourceGutterRendererPixbuf* gtkSourceGutterRendererPixbuf;

	/** Get the main Gtk struct */
	public GtkSourceGutterRendererPixbuf* getGutterRendererPixbufStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceGutterRendererPixbuf;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceGutterRendererPixbuf;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceGutterRendererPixbuf* gtkSourceGutterRendererPixbuf, bool ownedRef = false)
	{
		this.gtkSourceGutterRendererPixbuf = gtkSourceGutterRendererPixbuf;
		super(cast(GtkSourceGutterRenderer*)gtkSourceGutterRendererPixbuf, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_gutter_renderer_pixbuf_get_type();
	}

	/**
	 * Create a new #GtkSourceGutterRendererPixbuf.
	 *
	 * Returns: A #GtkSourceGutterRenderer
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_source_gutter_renderer_pixbuf_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceGutterRendererPixbuf*) __p, true);
	}

	/**
	 * Get the gicon of the renderer
	 *
	 * Returns: a #GIcon
	 */
	public IconIF getGicon()
	{
		auto __p = gtk_source_gutter_renderer_pixbuf_get_gicon(gtkSourceGutterRendererPixbuf);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconIF)(cast(GIcon*) __p);
	}

	/** */
	public string getIconName()
	{
		return Str.toString(gtk_source_gutter_renderer_pixbuf_get_icon_name(gtkSourceGutterRendererPixbuf));
	}

	/**
	 * Gets a #GdkPaintable that was set with
	 * gtk_source_gutter_renderer_pixbuf_set_paintable()
	 *
	 * Returns: a #GdkPaintable or %NULL
	 *
	 * Since: 5.0
	 */
	public PaintableIF getPaintable()
	{
		auto __p = gtk_source_gutter_renderer_pixbuf_get_paintable(gtkSourceGutterRendererPixbuf);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PaintableIF)(cast(GdkPaintable*) __p);
	}

	/**
	 * Get the pixbuf of the renderer.
	 *
	 * Returns: a #GdkPixbuf
	 */
	public Pixbuf getPixbuf()
	{
		auto __p = gtk_source_gutter_renderer_pixbuf_get_pixbuf(gtkSourceGutterRendererPixbuf);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Pixbuf)(cast(GdkPixbuf*) __p);
	}

	/**
	 * Allows overlaying a paintable on top of any other image that
	 * has been set for the pixbuf. This will be applied when the
	 * widget is next snapshot.
	 *
	 * Params:
	 *     paintable = a #GdkPaintable
	 *
	 * Since: 5.0
	 */
	public void overlayPaintable(PaintableIF paintable)
	{
		gtk_source_gutter_renderer_pixbuf_overlay_paintable(gtkSourceGutterRendererPixbuf, (paintable is null) ? null : paintable.getPaintableStruct());
	}

	/** */
	public void setGicon(IconIF icon)
	{
		gtk_source_gutter_renderer_pixbuf_set_gicon(gtkSourceGutterRendererPixbuf, (icon is null) ? null : icon.getIconStruct());
	}

	/** */
	public void setIconName(string iconName)
	{
		gtk_source_gutter_renderer_pixbuf_set_icon_name(gtkSourceGutterRendererPixbuf, Str.toStringz(iconName));
	}

	/** */
	public void setPaintable(PaintableIF paintable)
	{
		gtk_source_gutter_renderer_pixbuf_set_paintable(gtkSourceGutterRendererPixbuf, (paintable is null) ? null : paintable.getPaintableStruct());
	}

	/** */
	public void setPixbuf(Pixbuf pixbuf)
	{
		gtk_source_gutter_renderer_pixbuf_set_pixbuf(gtkSourceGutterRendererPixbuf, (pixbuf is null) ? null : pixbuf.getPixbufStruct());
	}
}
