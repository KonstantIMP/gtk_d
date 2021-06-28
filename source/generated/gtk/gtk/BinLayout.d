module gtk.BinLayout;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.LayoutManager;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkBinLayout` is a `GtkLayoutManager` subclass useful for create "bins" of
 * widgets.
 * 
 * `GtkBinLayout` will stack each child of a widget on top of each other,
 * using the [property@Gtk.Widget:hexpand], [property@Gtk.Widget:vexpand],
 * [property@Gtk.Widget:halign], and [property@Gtk.Widget:valign] properties
 * of each child to determine where they should be positioned.
 */
public class BinLayout : LayoutManager
{
	/** the main Gtk struct */
	protected GtkBinLayout* gtkBinLayout;

	/** Get the main Gtk struct */
	public GtkBinLayout* getBinLayoutStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkBinLayout;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkBinLayout;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkBinLayout* gtkBinLayout, bool ownedRef = false)
	{
		this.gtkBinLayout = gtkBinLayout;
		super(cast(GtkLayoutManager*)gtkBinLayout, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_bin_layout_get_type();
	}

	/**
	 * Creates a new `GtkBinLayout` instance.
	 *
	 * Returns: the newly created `GtkBinLayout`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_bin_layout_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkBinLayout*) __p, true);
	}
}
