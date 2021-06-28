module gsk.RepeatNode;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import graphene.Rect;
private import gsk.RenderNode;
private import gsk.c.functions;
public  import gsk.c.types;


/**
 * A render node repeating its single child node.
 */
public class RepeatNode : RenderNode
{
	/** the main Gtk struct */
	protected GskRepeatNode* gskRepeatNode;

	/** Get the main Gtk struct */
	public GskRepeatNode* getRepeatNodeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskRepeatNode;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskRepeatNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskRepeatNode* gskRepeatNode, bool ownedRef = false)
	{
		this.gskRepeatNode = gskRepeatNode;
		super(cast(GskRenderNode*)gskRepeatNode, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_repeat_node_get_type();
	}

	/**
	 * Creates a `GskRenderNode` that will repeat the drawing of @child across
	 * the given @bounds.
	 *
	 * Params:
	 *     bounds = The bounds of the area to be painted
	 *     child = The child to repeat
	 *     childBounds = The area of the child to repeat or %NULL to
	 *         use the child's bounds
	 *
	 * Returns: A new `GskRenderNode`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Rect bounds, RenderNode child, Rect childBounds)
	{
		auto __p = gsk_repeat_node_new((bounds is null) ? null : bounds.getRectStruct(), (child is null) ? null : child.getRenderNodeStruct(), (childBounds is null) ? null : childBounds.getRectStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskRepeatNode*) __p);
	}

	/**
	 * Retrieves the child of @node.
	 *
	 * Returns: a `GskRenderNode`
	 */
	public RenderNode getChild()
	{
		auto __p = gsk_repeat_node_get_child(cast(GskRenderNode*)gskRepeatNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RenderNode)(cast(GskRenderNode*) __p);
	}

	/**
	 * Retrieves the bounding rectangle of the child of @node.
	 *
	 * Returns: a bounding rectangle
	 */
	public Rect getChildBounds()
	{
		auto __p = gsk_repeat_node_get_child_bounds(cast(GskRenderNode*)gskRepeatNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Rect)(cast(graphene_rect_t*) __p);
	}
}
