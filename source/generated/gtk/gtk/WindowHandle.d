module gtk.WindowHandle;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Widget;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkWindowHandle` is a titlebar area widget.
 * 
 * When added into a window, it can be dragged to move the window, and handles
 * right click, double click and middle click as expected of a titlebar.
 * 
 * # CSS nodes
 * 
 * `GtkWindowHandle` has a single CSS node with the name `windowhandle`.
 * 
 * # Accessibility
 * 
 * `GtkWindowHandle` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
 */
public class WindowHandle : Widget
{
	/** the main Gtk struct */
	protected GtkWindowHandle* gtkWindowHandle;

	/** Get the main Gtk struct */
	public GtkWindowHandle* getWindowHandleStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkWindowHandle;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkWindowHandle;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkWindowHandle* gtkWindowHandle, bool ownedRef = false)
	{
		this.gtkWindowHandle = gtkWindowHandle;
		super(cast(GtkWidget*)gtkWindowHandle, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_window_handle_get_type();
	}

	/**
	 * Creates a new `GtkWindowHandle`.
	 *
	 * Returns: a new `GtkWindowHandle`.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_window_handle_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkWindowHandle*) __p);
	}

	/**
	 * Gets the child widget of @self.
	 *
	 * Returns: the child widget of @self
	 */
	public Widget getChild()
	{
		auto __p = gtk_window_handle_get_child(gtkWindowHandle);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) __p);
	}

	/**
	 * Sets the child widget of @self.
	 *
	 * Params:
	 *     child = the child widget
	 */
	public void setChild(Widget child)
	{
		gtk_window_handle_set_child(gtkWindowHandle, (child is null) ? null : child.getWidgetStruct());
	}
}
