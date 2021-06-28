module gsk.BlendNode;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gsk.RenderNode;
private import gsk.c.functions;
public  import gsk.c.types;


/**
 * A render node applying a blending function between its two child nodes.
 */
public class BlendNode : RenderNode
{
	/** the main Gtk struct */
	protected GskBlendNode* gskBlendNode;

	/** Get the main Gtk struct */
	public GskBlendNode* getBlendNodeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskBlendNode;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskBlendNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskBlendNode* gskBlendNode, bool ownedRef = false)
	{
		this.gskBlendNode = gskBlendNode;
		super(cast(GskRenderNode*)gskBlendNode, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_blend_node_get_type();
	}

	/**
	 * Creates a `GskRenderNode` that will use @blend_mode to blend the @top
	 * node onto the @bottom node.
	 *
	 * Params:
	 *     bottom = The bottom node to be drawn
	 *     top = The node to be blended onto the @bottom node
	 *     blendMode = The blend mode to use
	 *
	 * Returns: A new `GskRenderNode`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(RenderNode bottom, RenderNode top, GskBlendMode blendMode)
	{
		auto __p = gsk_blend_node_new((bottom is null) ? null : bottom.getRenderNodeStruct(), (top is null) ? null : top.getRenderNodeStruct(), blendMode);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskBlendNode*) __p);
	}

	/**
	 * Retrieves the blend mode used by @node.
	 *
	 * Returns: the blend mode
	 */
	public GskBlendMode getBlendMode()
	{
		return gsk_blend_node_get_blend_mode(cast(GskRenderNode*)gskBlendNode);
	}

	/**
	 * Retrieves the bottom `GskRenderNode` child of the @node.
	 *
	 * Returns: the bottom child node
	 */
	public RenderNode getBottomChild()
	{
		auto __p = gsk_blend_node_get_bottom_child(cast(GskRenderNode*)gskBlendNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RenderNode)(cast(GskRenderNode*) __p);
	}

	/**
	 * Retrieves the top `GskRenderNode` child of the @node.
	 *
	 * Returns: the top child node
	 */
	public RenderNode getTopChild()
	{
		auto __p = gsk_blend_node_get_top_child(cast(GskRenderNode*)gskBlendNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RenderNode)(cast(GskRenderNode*) __p);
	}
}
