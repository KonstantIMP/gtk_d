module sourceview.MarkAttributes;

private import gdk.PaintableIF;
private import gdk.RGBA;
private import gdkpixbuf.Pixbuf;
private import gio.IconIF;
private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Widget;
private import sourceview.Mark;
private import sourceview.c.functions;
public  import sourceview.c.types;
private import std.algorithm;


/** */
public class MarkAttributes : ObjectG
{
	/** the main Gtk struct */
	protected GtkSourceMarkAttributes* gtkSourceMarkAttributes;

	/** Get the main Gtk struct */
	public GtkSourceMarkAttributes* getMarkAttributesStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceMarkAttributes;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceMarkAttributes;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceMarkAttributes* gtkSourceMarkAttributes, bool ownedRef = false)
	{
		this.gtkSourceMarkAttributes = gtkSourceMarkAttributes;
		super(cast(GObject*)gtkSourceMarkAttributes, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_mark_attributes_get_type();
	}

	/**
	 * Creates a new source mark attributes.
	 *
	 * Returns: a new source mark attributes.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_source_mark_attributes_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceMarkAttributes*) __p, true);
	}

	/**
	 * Stores background color in @background.
	 *
	 * Params:
	 *     background = a #GdkRGBA.
	 *
	 * Returns: whether background color for @attributes was set.
	 */
	public bool getBackground(out RGBA background)
	{
		GdkRGBA* outbackground = sliceNew!GdkRGBA();

		auto __p = gtk_source_mark_attributes_get_background(gtkSourceMarkAttributes, outbackground) != 0;

		background = ObjectG.getDObject!(RGBA)(outbackground, true);

		return __p;
	}

	/**
	 * Gets a #GIcon to be used as a base for rendered icon. Note that the icon can
	 * be %NULL if it wasn't set earlier.
	 *
	 * Returns: An icon. The icon belongs to @attributes and should
	 *     not be unreffed.
	 */
	public IconIF getGicon()
	{
		auto __p = gtk_source_mark_attributes_get_gicon(gtkSourceMarkAttributes);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconIF)(cast(GIcon*) __p);
	}

	/**
	 * Gets a name of an icon to be used as a base for rendered icon. Note that the
	 * icon name can be %NULL if it wasn't set earlier.
	 *
	 * Returns: An icon name. The string belongs to @attributes and
	 *     should not be freed.
	 */
	public string getIconName()
	{
		return Str.toString(gtk_source_mark_attributes_get_icon_name(gtkSourceMarkAttributes));
	}

	/**
	 * Gets a #GdkPixbuf to be used as a base for rendered icon. Note that the
	 * pixbuf can be %NULL if it wasn't set earlier.
	 *
	 * Returns: A pixbuf. The pixbuf belongs to @attributes and
	 *     should not be unreffed.
	 */
	public Pixbuf getPixbuf()
	{
		auto __p = gtk_source_mark_attributes_get_pixbuf(gtkSourceMarkAttributes);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Pixbuf)(cast(GdkPixbuf*) __p);
	}

	/**
	 * Queries for a tooltip by emitting
	 * a #GtkSourceMarkAttributes::query-tooltip-markup signal. The tooltip may contain
	 * a markup.
	 *
	 * Params:
	 *     mark = a #GtkSourceMark.
	 *
	 * Returns: A tooltip. The returned string should be freed by
	 *     using g_free() when done with it.
	 */
	public string getTooltipMarkup(Mark mark)
	{
		auto retStr = gtk_source_mark_attributes_get_tooltip_markup(gtkSourceMarkAttributes, (mark is null) ? null : mark.getMarkStruct());

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Queries for a tooltip by emitting
	 * a #GtkSourceMarkAttributes::query-tooltip-text signal. The tooltip is a plain
	 * text.
	 *
	 * Params:
	 *     mark = a #GtkSourceMark.
	 *
	 * Returns: A tooltip. The returned string should be freed by
	 *     using g_free() when done with it.
	 */
	public string getTooltipText(Mark mark)
	{
		auto retStr = gtk_source_mark_attributes_get_tooltip_text(gtkSourceMarkAttributes, (mark is null) ? null : mark.getMarkStruct());

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Renders an icon of given size. The base of the icon is set by the last call
	 * to one of: gtk_source_mark_attributes_set_pixbuf(),
	 * gtk_source_mark_attributes_set_gicon() or
	 * gtk_source_mark_attributes_set_icon_name(). @size cannot be lower than 1.
	 *
	 * Params:
	 *     widget = widget of which style settings may be used.
	 *     size = size of the rendered icon.
	 *
	 * Returns: A #GdkPaintable. The paintable belongs to @attributes
	 *     and should not be unreffed.
	 */
	public PaintableIF renderIcon(Widget widget, int size)
	{
		auto __p = gtk_source_mark_attributes_render_icon(gtkSourceMarkAttributes, (widget is null) ? null : widget.getWidgetStruct(), size);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PaintableIF)(cast(GdkPaintable*) __p);
	}

	/**
	 * Sets background color to the one given in @background.
	 *
	 * Params:
	 *     background = a #GdkRGBA.
	 */
	public void setBackground(RGBA background)
	{
		gtk_source_mark_attributes_set_background(gtkSourceMarkAttributes, (background is null) ? null : background.getRGBAStruct());
	}

	/**
	 * Sets an icon to be used as a base for rendered icon.
	 *
	 * Params:
	 *     gicon = a #GIcon to be used.
	 */
	public void setGicon(IconIF gicon)
	{
		gtk_source_mark_attributes_set_gicon(gtkSourceMarkAttributes, (gicon is null) ? null : gicon.getIconStruct());
	}

	/**
	 * Sets a name of an icon to be used as a base for rendered icon.
	 *
	 * Params:
	 *     iconName = name of an icon to be used.
	 */
	public void setIconName(string iconName)
	{
		gtk_source_mark_attributes_set_icon_name(gtkSourceMarkAttributes, Str.toStringz(iconName));
	}

	/**
	 * Sets a pixbuf to be used as a base for rendered icon.
	 *
	 * Params:
	 *     pixbuf = a #GdkPixbuf to be used.
	 */
	public void setPixbuf(Pixbuf pixbuf)
	{
		gtk_source_mark_attributes_set_pixbuf(gtkSourceMarkAttributes, (pixbuf is null) ? null : pixbuf.getPixbufStruct());
	}

	/**
	 * The code should connect to this signal to provide a tooltip for given
	 * @mark. The tooltip can contain a markup.
	 *
	 * Params:
	 *     mark = The #GtkSourceMark.
	 *
	 * Returns: A tooltip. The string should be freed with
	 *     g_free() when done with it.
	 */
	gulong addOnQueryTooltipMarkup(string delegate(Mark, MarkAttributes) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "query-tooltip-markup", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The code should connect to this signal to provide a tooltip for given
	 * @mark. The tooltip should be just a plain text.
	 *
	 * Params:
	 *     mark = The #GtkSourceMark.
	 *
	 * Returns: A tooltip. The string should be freed with
	 *     g_free() when done with it.
	 */
	gulong addOnQueryTooltipText(string delegate(Mark, MarkAttributes) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "query-tooltip-text", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
