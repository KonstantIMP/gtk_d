module gsk.RepeatingRadialGradientNode;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import graphene.Point;
private import graphene.Rect;
private import gsk.RenderNode;
private import gsk.c.functions;
public  import gsk.c.types;


/**
 * A render node for a repeating radial gradient.
 */
public class RepeatingRadialGradientNode : RenderNode
{
	/** the main Gtk struct */
	protected GskRepeatingRadialGradientNode* gskRepeatingRadialGradientNode;

	/** Get the main Gtk struct */
	public GskRepeatingRadialGradientNode* getRepeatingRadialGradientNodeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskRepeatingRadialGradientNode;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskRepeatingRadialGradientNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskRepeatingRadialGradientNode* gskRepeatingRadialGradientNode, bool ownedRef = false)
	{
		this.gskRepeatingRadialGradientNode = gskRepeatingRadialGradientNode;
		super(cast(GskRenderNode*)gskRepeatingRadialGradientNode, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_repeating_radial_gradient_node_get_type();
	}

	/**
	 * Creates a `GskRenderNode` that draws a repeating radial gradient.
	 *
	 * The radial gradient starts around @center. The size of the gradient
	 * is dictated by @hradius in horizontal orientation and by @vradius
	 * in vertial orientation.
	 *
	 * Params:
	 *     bounds = the bounds of the node
	 *     center = the center of the gradient
	 *     hradius = the horizontal radius
	 *     vradius = the vertical radius
	 *     start = a percentage >= 0 that defines the start of the gradient around @center
	 *     end = a percentage >= 0 that defines the end of the gradient around @center
	 *     colorStops = a pointer to an array of
	 *         `GskColorStop` defining the gradient. The offsets of all color stops
	 *         must be increasing. The first stop's offset must be >= 0 and the last
	 *         stop's offset must be <= 1.
	 *
	 * Returns: A new `GskRenderNode`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Rect bounds, Point center, float hradius, float vradius, float start, float end, GskColorStop[] colorStops)
	{
		auto __p = gsk_repeating_radial_gradient_node_new((bounds is null) ? null : bounds.getRectStruct(), (center is null) ? null : center.getPointStruct(), hradius, vradius, start, end, colorStops.ptr, cast(size_t)colorStops.length);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskRepeatingRadialGradientNode*) __p);
	}
}
