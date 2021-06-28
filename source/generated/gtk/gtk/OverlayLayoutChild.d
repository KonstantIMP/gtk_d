module gtk.OverlayLayoutChild;

private import gtk.LayoutChild;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkLayoutChild` subclass for children in a `GtkOverlayLayout`.
 */
public class OverlayLayoutChild : LayoutChild
{
	/** the main Gtk struct */
	protected GtkOverlayLayoutChild* gtkOverlayLayoutChild;

	/** Get the main Gtk struct */
	public GtkOverlayLayoutChild* getOverlayLayoutChildStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkOverlayLayoutChild;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkOverlayLayoutChild;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkOverlayLayoutChild* gtkOverlayLayoutChild, bool ownedRef = false)
	{
		this.gtkOverlayLayoutChild = gtkOverlayLayoutChild;
		super(cast(GtkLayoutChild*)gtkOverlayLayoutChild, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_overlay_layout_child_get_type();
	}

	/**
	 * Retrieves whether the child is clipped.
	 *
	 * Returns: whether the child is clipped
	 */
	public bool getClipOverlay()
	{
		return gtk_overlay_layout_child_get_clip_overlay(gtkOverlayLayoutChild) != 0;
	}

	/**
	 * Retrieves whether the child is measured.
	 *
	 * Returns: whether the child is measured
	 */
	public bool getMeasure()
	{
		return gtk_overlay_layout_child_get_measure(gtkOverlayLayoutChild) != 0;
	}

	/**
	 * Sets whether to clip this child.
	 *
	 * Params:
	 *     clipOverlay = whether to clip this child
	 */
	public void setClipOverlay(bool clipOverlay)
	{
		gtk_overlay_layout_child_set_clip_overlay(gtkOverlayLayoutChild, clipOverlay);
	}

	/**
	 * Sets whether to measure this child.
	 *
	 * Params:
	 *     measure = whether to measure this child
	 */
	public void setMeasure(bool measure)
	{
		gtk_overlay_layout_child_set_measure(gtkOverlayLayoutChild, measure);
	}
}
