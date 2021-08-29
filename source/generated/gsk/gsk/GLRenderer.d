module gsk.GLRenderer;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gsk.Renderer;
private import gsk.c.functions;
public  import gsk.c.types;


/**
 * A GSK renderer that is using OpenGL.
 */
public class GLRenderer : Renderer
{
	/** the main Gtk struct */
	protected GskGLRenderer* gskGLRenderer;

	/** Get the main Gtk struct */
	public GskGLRenderer* getGLRendererStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskGLRenderer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskGLRenderer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskGLRenderer* gskGLRenderer, bool ownedRef = false)
	{
		this.gskGLRenderer = gskGLRenderer;
		super(cast(GskRenderer*)gskGLRenderer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_gl_renderer_get_type();
	}

	/**
	 * Creates a new `GskRenderer` using OpenGL.
	 *
	 * Returns: a new GL renderer
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gsk_gl_renderer_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskGLRenderer*) __p, true);
	}
}
