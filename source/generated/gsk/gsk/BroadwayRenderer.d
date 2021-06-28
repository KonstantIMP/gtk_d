module gsk.BroadwayRenderer;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gsk.Renderer;
private import gsk.c.functions;
public  import gsk.c.types;


/** */
public class BroadwayRenderer : Renderer
{
	/** the main Gtk struct */
	protected GskBroadwayRenderer* gskBroadwayRenderer;

	/** Get the main Gtk struct */
	public GskBroadwayRenderer* getBroadwayRendererStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskBroadwayRenderer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskBroadwayRenderer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskBroadwayRenderer* gskBroadwayRenderer, bool ownedRef = false)
	{
		this.gskBroadwayRenderer = gskBroadwayRenderer;
		super(cast(GskRenderer*)gskBroadwayRenderer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_broadway_renderer_get_type();
	}

	/**
	 * Creates a new Broadway renderer.
	 *
	 * The Broadway renderer is the default renderer for the broadway backend.
	 * It will only work with broadway surfaces, otherwise it will fail the
	 * call to gsk_renderer_realize().
	 *
	 * This function is only available when GTK was compiled with Broadway
	 * support.
	 *
	 * Returns: a new Broadway renderer.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gsk_broadway_renderer_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskBroadwayRenderer*) __p, true);
	}
}
