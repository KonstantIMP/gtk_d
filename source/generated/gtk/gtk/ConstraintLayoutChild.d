module gtk.ConstraintLayoutChild;

private import gtk.LayoutChild;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkLayoutChild` subclass for children in a `GtkConstraintLayout`.
 */
public class ConstraintLayoutChild : LayoutChild
{
	/** the main Gtk struct */
	protected GtkConstraintLayoutChild* gtkConstraintLayoutChild;

	/** Get the main Gtk struct */
	public GtkConstraintLayoutChild* getConstraintLayoutChildStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkConstraintLayoutChild;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkConstraintLayoutChild;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkConstraintLayoutChild* gtkConstraintLayoutChild, bool ownedRef = false)
	{
		this.gtkConstraintLayoutChild = gtkConstraintLayoutChild;
		super(cast(GtkLayoutChild*)gtkConstraintLayoutChild, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_constraint_layout_child_get_type();
	}
}
