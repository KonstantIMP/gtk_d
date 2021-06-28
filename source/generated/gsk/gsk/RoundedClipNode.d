module gsk.RoundedClipNode;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gsk.RenderNode;
private import gsk.RoundedRect;
private import gsk.c.functions;
public  import gsk.c.types;


/**
 * A render node applying a rounded rectangle clip to its single child.
 */
public class RoundedClipNode : RenderNode
{
	/** the main Gtk struct */
	protected GskRoundedClipNode* gskRoundedClipNode;

	/** Get the main Gtk struct */
	public GskRoundedClipNode* getRoundedClipNodeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskRoundedClipNode;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskRoundedClipNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskRoundedClipNode* gskRoundedClipNode, bool ownedRef = false)
	{
		this.gskRoundedClipNode = gskRoundedClipNode;
		super(cast(GskRenderNode*)gskRoundedClipNode, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_rounded_clip_node_get_type();
	}

	/**
	 * Creates a `GskRenderNode` that will clip the @child to the area
	 * given by @clip.
	 *
	 * Params:
	 *     child = The node to draw
	 *     clip = The clip to apply
	 *
	 * Returns: A new `GskRenderNode`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(RenderNode child, RoundedRect clip)
	{
		auto __p = gsk_rounded_clip_node_new((child is null) ? null : child.getRenderNodeStruct(), (clip is null) ? null : clip.getRoundedRectStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskRoundedClipNode*) __p);
	}

	/**
	 * Gets the child node that is getting clipped by the given @node.
	 *
	 * Returns: The child that is getting clipped
	 */
	public RenderNode getChild()
	{
		auto __p = gsk_rounded_clip_node_get_child(cast(GskRenderNode*)gskRoundedClipNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RenderNode)(cast(GskRenderNode*) __p);
	}

	/**
	 * Retrieves the rounded rectangle used to clip the contents of the @node.
	 *
	 * Returns: a rounded rectangle
	 */
	public RoundedRect getClip()
	{
		auto __p = gsk_rounded_clip_node_get_clip(cast(GskRenderNode*)gskRoundedClipNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RoundedRect)(cast(GskRoundedRect*) __p);
	}
}
