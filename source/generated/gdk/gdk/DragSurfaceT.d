module gdk.DragSurfaceT;

public  import gdk.c.functions;
public  import gdk.c.types;


/**
 * A #GdkDragSurface is an interface for surfaces used during DND.
 */
public template DragSurfaceT(TStruct)
{
	/** Get the main Gtk struct */
	public GdkDragSurface* getDragSurfaceStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GdkDragSurface*)getStruct();
	}


	/**
	 * Present @drag_surface.
	 *
	 * Params:
	 *     width = the unconstrained drag_surface width to layout
	 *     height = the unconstrained drag_surface height to layout
	 *
	 * Returns: %FALSE if it failed to be presented, otherwise %TRUE.
	 */
	public bool present(int width, int height)
	{
		return gdk_drag_surface_present(getDragSurfaceStruct(), width, height) != 0;
	}
}
