module gsk.TextureNode;

private import gdk.Texture;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import graphene.Rect;
private import gsk.RenderNode;
private import gsk.c.functions;
public  import gsk.c.types;


/**
 * A render node for a #GdkTexture.
 */
public class TextureNode : RenderNode
{
	/** the main Gtk struct */
	protected GskTextureNode* gskTextureNode;

	/** Get the main Gtk struct */
	public GskTextureNode* getTextureNodeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskTextureNode;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskTextureNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskTextureNode* gskTextureNode, bool ownedRef = false)
	{
		this.gskTextureNode = gskTextureNode;
		super(cast(GskRenderNode*)gskTextureNode, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_texture_node_get_type();
	}

	/**
	 * Creates a `GskRenderNode` that will render the given
	 * @texture into the area given by @bounds.
	 *
	 * Params:
	 *     texture = the `GdkTexture`
	 *     bounds = the rectangle to render the texture into
	 *
	 * Returns: A new `GskRenderNode`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Texture texture, Rect bounds)
	{
		auto __p = gsk_texture_node_new((texture is null) ? null : texture.getTextureStruct(), (bounds is null) ? null : bounds.getRectStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskTextureNode*) __p);
	}

	/**
	 * Retrieves the `GdkTexture` used when creating this `GskRenderNode`.
	 *
	 * Returns: the `GdkTexture`
	 */
	public Texture getTexture()
	{
		auto __p = gsk_texture_node_get_texture(cast(GskRenderNode*)gskTextureNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Texture)(cast(GdkTexture*) __p);
	}
}
