module gtk.Separator;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.OrientableIF;
private import gtk.OrientableT;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkSeparator` is a horizontal or vertical separator widget.
 * 
 * ![An example GtkSeparator](separators.png)
 * 
 * A `GtkSeparator` can be used to group the widgets within a window.
 * It displays a line with a shadow to make it appear sunken into the
 * interface.
 * 
 * # CSS nodes
 * 
 * `GtkSeparator` has a single CSS node with name separator. The node
 * gets one of the .horizontal or .vertical style classes.
 * 
 * # Accessibility
 * 
 * `GtkSeparator` uses the #GTK_ACCESSIBLE_ROLE_SEPARATOR role.
 */
public class Separator : Widget, OrientableIF
{
	/** the main Gtk struct */
	protected GtkSeparator* gtkSeparator;

	/** Get the main Gtk struct */
	public GtkSeparator* getSeparatorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSeparator;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSeparator;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSeparator* gtkSeparator, bool ownedRef = false)
	{
		this.gtkSeparator = gtkSeparator;
		super(cast(GtkWidget*)gtkSeparator, ownedRef);
	}

	// add the Orientable capabilities
	mixin OrientableT!(GtkSeparator);


	/** */
	public static GType getType()
	{
		return gtk_separator_get_type();
	}

	/**
	 * Creates a new `GtkSeparator` with the given orientation.
	 *
	 * Params:
	 *     orientation = the separator’s orientation.
	 *
	 * Returns: a new `GtkSeparator`.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GtkOrientation orientation)
	{
		auto __p = gtk_separator_new(orientation);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSeparator*) __p);
	}
}
