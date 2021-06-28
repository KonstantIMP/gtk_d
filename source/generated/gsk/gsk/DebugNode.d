module gsk.DebugNode;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gsk.RenderNode;
private import gsk.c.functions;
public  import gsk.c.types;


/**
 * A render node that emits a debugging message when drawing its
 * child node.
 */
public class DebugNode : RenderNode
{
	/** the main Gtk struct */
	protected GskDebugNode* gskDebugNode;

	/** Get the main Gtk struct */
	public GskDebugNode* getDebugNodeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskDebugNode;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskDebugNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskDebugNode* gskDebugNode, bool ownedRef = false)
	{
		this.gskDebugNode = gskDebugNode;
		super(cast(GskRenderNode*)gskDebugNode, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_debug_node_get_type();
	}

	/**
	 * Creates a `GskRenderNode` that will add debug information about
	 * the given @child.
	 *
	 * Adding this node has no visual effect.
	 *
	 * Params:
	 *     child = The child to add debug info for
	 *     message = The debug message
	 *
	 * Returns: A new `GskRenderNode`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(RenderNode child, string message)
	{
		auto __p = gsk_debug_node_new((child is null) ? null : child.getRenderNodeStruct(), Str.toStringz(message));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskDebugNode*) __p);
	}

	/**
	 * Gets the child node that is getting drawn by the given @node.
	 *
	 * Returns: the child `GskRenderNode`
	 */
	public RenderNode getChild()
	{
		auto __p = gsk_debug_node_get_child(cast(GskRenderNode*)gskDebugNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RenderNode)(cast(GskRenderNode*) __p);
	}

	/**
	 * Gets the debug message that was set on this node
	 *
	 * Returns: The debug message
	 */
	public string getMessage()
	{
		return Str.toString(gsk_debug_node_get_message(cast(GskRenderNode*)gskDebugNode));
	}
}
