module gtk.ListBase;

private import gtk.OrientableIF;
private import gtk.OrientableT;
private import gtk.ScrollableIF;
private import gtk.ScrollableT;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkListBase` is the abstract base class for GTK's list widgets.
 */
public class ListBase : Widget, OrientableIF, ScrollableIF
{
	/** the main Gtk struct */
	protected GtkListBase* gtkListBase;

	/** Get the main Gtk struct */
	public GtkListBase* getListBaseStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkListBase;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkListBase;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkListBase* gtkListBase, bool ownedRef = false)
	{
		this.gtkListBase = gtkListBase;
		super(cast(GtkWidget*)gtkListBase, ownedRef);
	}

	// add the Orientable capabilities
	mixin OrientableT!(GtkListBase);

	// add the Scrollable capabilities
	mixin ScrollableT!(GtkListBase);


	/** */
	public static GType getType()
	{
		return gtk_list_base_get_type();
	}
}
