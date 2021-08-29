module gsk.NglRenderer;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gsk.Renderer;
private import gsk.c.functions;
public  import gsk.c.types;


/** */
public class NglRenderer : Renderer
{
	/** the main Gtk struct */
	protected GskNglRenderer* gskNglRenderer;

	/** Get the main Gtk struct */
	public GskNglRenderer* getNglRendererStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskNglRenderer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskNglRenderer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskNglRenderer* gskNglRenderer, bool ownedRef = false)
	{
		this.gskNglRenderer = gskNglRenderer;
		super(cast(GskRenderer*)gskNglRenderer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_ngl_renderer_get_type();
	}

	/**
	 * Creates a new `GskRenderer` using the new OpenGL renderer.
	 *
	 * Returns: a new NGL renderer
	 *
	 * Since: 4.2
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gsk_ngl_renderer_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskNglRenderer*) __p, true);
	}
}
