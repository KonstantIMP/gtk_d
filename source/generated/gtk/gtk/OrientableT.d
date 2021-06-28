module gtk.OrientableT;

public  import gtk.c.functions;
public  import gtk.c.types;


/**
 * The `GtkOrientable` interface is implemented by all widgets that can be
 * oriented horizontally or vertically.
 * 
 * `GtkOrientable` is more flexible in that it allows the orientation to be
 * changed at runtime, allowing the widgets to “flip”.
 */
public template OrientableT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkOrientable* getOrientableStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkOrientable*)getStruct();
	}


	/**
	 * Retrieves the orientation of the @orientable.
	 *
	 * Returns: the orientation of the @orientable.
	 */
	public GtkOrientation getOrientation()
	{
		return gtk_orientable_get_orientation(getOrientableStruct());
	}

	/**
	 * Sets the orientation of the @orientable.
	 *
	 * Params:
	 *     orientation = the orientable’s new orientation.
	 */
	public void setOrientation(GtkOrientation orientation)
	{
		gtk_orientable_set_orientation(getOrientableStruct(), orientation);
	}
}
