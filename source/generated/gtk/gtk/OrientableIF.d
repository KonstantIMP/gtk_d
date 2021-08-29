module gtk.OrientableIF;

private import gtk.c.functions;
public  import gtk.c.types;


/**
 * The `GtkOrientable` interface is implemented by all widgets that can be
 * oriented horizontally or vertically.
 * 
 * `GtkOrientable` is more flexible in that it allows the orientation to be
 * changed at runtime, allowing the widgets to “flip”.
 */
public interface OrientableIF{
	/** Get the main Gtk struct */
	public GtkOrientable* getOrientableStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_orientable_get_type();
	}

	/**
	 * Retrieves the orientation of the @orientable.
	 *
	 * Returns: the orientation of the @orientable
	 */
	public GtkOrientation getOrientation();

	/**
	 * Sets the orientation of the @orientable.
	 *
	 * Params:
	 *     orientation = the orientable’s new orientation
	 */
	public void setOrientation(GtkOrientation orientation);
}
