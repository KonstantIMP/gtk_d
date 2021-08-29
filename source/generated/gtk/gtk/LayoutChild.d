module gtk.LayoutChild;

private import gobject.ObjectG;
private import gtk.LayoutManager;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkLayoutChild` is the base class for objects that are meant to hold
 * layout properties.
 * 
 * If a `GtkLayoutManager` has per-child properties, like their packing type,
 * or the horizontal and vertical span, or the icon name, then the layout
 * manager should use a `GtkLayoutChild` implementation to store those properties.
 * 
 * A `GtkLayoutChild` instance is only ever valid while a widget is part
 * of a layout.
 */
public class LayoutChild : ObjectG
{
	/** the main Gtk struct */
	protected GtkLayoutChild* gtkLayoutChild;

	/** Get the main Gtk struct */
	public GtkLayoutChild* getLayoutChildStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkLayoutChild;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkLayoutChild;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkLayoutChild* gtkLayoutChild, bool ownedRef = false)
	{
		this.gtkLayoutChild = gtkLayoutChild;
		super(cast(GObject*)gtkLayoutChild, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_layout_child_get_type();
	}

	/**
	 * Retrieves the `GtkWidget` associated to the given @layout_child.
	 *
	 * Returns: a `GtkWidget`
	 */
	public Widget getChildWidget()
	{
		auto __p = gtk_layout_child_get_child_widget(gtkLayoutChild);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Retrieves the `GtkLayoutManager` instance that created the
	 * given @layout_child.
	 *
	 * Returns: a `GtkLayoutManager`
	 */
	public LayoutManager getLayoutManager()
	{
		auto __p = gtk_layout_child_get_layout_manager(gtkLayoutChild);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(LayoutManager)(cast(GtkLayoutManager*) __p);
	}
}
