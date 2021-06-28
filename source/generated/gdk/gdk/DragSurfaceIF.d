module gdk.DragSurfaceIF;

private import gdk.c.functions;
public  import gdk.c.types;


/**
 * A #GdkDragSurface is an interface for surfaces used during DND.
 */
public interface DragSurfaceIF{
	/** Get the main Gtk struct */
	public GdkDragSurface* getDragSurfaceStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gdk_drag_surface_get_type();
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
	public bool present(int width, int height);
}
