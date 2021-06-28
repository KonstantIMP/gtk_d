module gsk.CairoNode;

private import cairo.Context;
private import cairo.Surface;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import graphene.Rect;
private import gsk.RenderNode;
private import gsk.c.functions;
public  import gsk.c.types;


/**
 * A render node for a Cairo surface.
 */
public class CairoNode : RenderNode
{
	/** the main Gtk struct */
	protected GskCairoNode* gskCairoNode;

	/** Get the main Gtk struct */
	public GskCairoNode* getCairoNodeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskCairoNode;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskCairoNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskCairoNode* gskCairoNode, bool ownedRef = false)
	{
		this.gskCairoNode = gskCairoNode;
		super(cast(GskRenderNode*)gskCairoNode, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_cairo_node_get_type();
	}

	/**
	 * Creates a `GskRenderNode` that will render a cairo surface
	 * into the area given by @bounds.
	 *
	 * You can draw to the cairo surface using [method@Gsk.CairoNode.get_draw_context].
	 *
	 * Params:
	 *     bounds = the rectangle to render to
	 *
	 * Returns: A new `GskRenderNode`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Rect bounds)
	{
		auto __p = gsk_cairo_node_new((bounds is null) ? null : bounds.getRectStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskCairoNode*) __p);
	}

	/**
	 * Creates a Cairo context for drawing using the surface associated
	 * to the render node.
	 *
	 * If no surface exists yet, a surface will be created optimized for
	 * rendering to @renderer.
	 *
	 * Returns: a Cairo context used for drawing; use
	 *     cairo_destroy() when done drawing
	 */
	public Context getDrawContext()
	{
		auto __p = gsk_cairo_node_get_draw_context(cast(GskRenderNode*)gskCairoNode);

		if(__p is null)
		{
			return null;
		}

		return new Context(cast(cairo_t*) __p);
	}

	/**
	 * Retrieves the Cairo surface used by the render node.
	 *
	 * Returns: a Cairo surface
	 */
	public Surface getSurface()
	{
		auto __p = gsk_cairo_node_get_surface(cast(GskRenderNode*)gskCairoNode);

		if(__p is null)
		{
			return null;
		}

		return new Surface(cast(cairo_surface_t*) __p);
	}
}
