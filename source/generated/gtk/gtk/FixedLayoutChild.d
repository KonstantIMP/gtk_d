module gtk.FixedLayoutChild;

private import gobject.ObjectG;
private import gsk.Transform;
private import gtk.LayoutChild;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkLayoutChild` subclass for children in a `GtkFixedLayout`.
 */
public class FixedLayoutChild : LayoutChild
{
	/** the main Gtk struct */
	protected GtkFixedLayoutChild* gtkFixedLayoutChild;

	/** Get the main Gtk struct */
	public GtkFixedLayoutChild* getFixedLayoutChildStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkFixedLayoutChild;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkFixedLayoutChild;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkFixedLayoutChild* gtkFixedLayoutChild, bool ownedRef = false)
	{
		this.gtkFixedLayoutChild = gtkFixedLayoutChild;
		super(cast(GtkLayoutChild*)gtkFixedLayoutChild, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_fixed_layout_child_get_type();
	}

	/**
	 * Retrieves the transformation of the child.
	 *
	 * Returns: a `GskTransform`
	 */
	public Transform getTransform()
	{
		auto __p = gtk_fixed_layout_child_get_transform(gtkFixedLayoutChild);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Transform)(cast(GskTransform*) __p);
	}

	/**
	 * Sets the transformation of the child of a `GtkFixedLayout`.
	 *
	 * Params:
	 *     transform = a `GskTransform`
	 */
	public void setTransform(Transform transform)
	{
		gtk_fixed_layout_child_set_transform(gtkFixedLayoutChild, (transform is null) ? null : transform.getTransformStruct());
	}
}
