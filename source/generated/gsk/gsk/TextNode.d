module gsk.TextNode;

private import gdk.RGBA;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import graphene.Point;
private import gsk.RenderNode;
private import gsk.c.functions;
public  import gsk.c.types;
private import pango.PgFont;
private import pango.PgGlyphString;


/**
 * A render node drawing a set of glyphs.
 */
public class TextNode : RenderNode
{
	/** the main Gtk struct */
	protected GskTextNode* gskTextNode;

	/** Get the main Gtk struct */
	public GskTextNode* getTextNodeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskTextNode;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskTextNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskTextNode* gskTextNode, bool ownedRef = false)
	{
		this.gskTextNode = gskTextNode;
		super(cast(GskRenderNode*)gskTextNode, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_text_node_get_type();
	}

	/**
	 * Creates a render node that renders the given glyphs.
	 *
	 * Note that @color may not be used if the font contains
	 * color glyphs.
	 *
	 * Params:
	 *     font = the #PangoFont containing the glyphs
	 *     glyphs = the #PangoGlyphString to render
	 *     color = the foreground color to render with
	 *     offset = offset of the baseline
	 *
	 * Returns: a new `GskRenderNode`
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(PgFont font, PgGlyphString glyphs, RGBA color, Point offset)
	{
		auto __p = gsk_text_node_new((font is null) ? null : font.getPgFontStruct(), (glyphs is null) ? null : glyphs.getPgGlyphStringStruct(), (color is null) ? null : color.getRGBAStruct(), (offset is null) ? null : offset.getPointStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskTextNode*) __p);
	}

	/**
	 * Retrieves the color used by the text @node.
	 *
	 * Returns: the text color
	 */
	public RGBA getColor()
	{
		auto __p = gsk_text_node_get_color(cast(GskRenderNode*)gskTextNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RGBA)(cast(GdkRGBA*) __p);
	}

	/**
	 * Returns the font used by the text @node.
	 *
	 * Returns: the font
	 */
	public PgFont getFont()
	{
		auto __p = gsk_text_node_get_font(cast(GskRenderNode*)gskTextNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgFont)(cast(PangoFont*) __p);
	}

	/**
	 * Retrieves the glyph information in the @node.
	 *
	 * Returns: the glyph information
	 */
	public PangoGlyphInfo[] getGlyphs()
	{
		uint nGlyphs;

		auto __p = gsk_text_node_get_glyphs(cast(GskRenderNode*)gskTextNode, &nGlyphs);

		return __p[0 .. nGlyphs];
	}

	/**
	 * Retrieves the number of glyphs in the text node.
	 *
	 * Returns: the number of glyphs
	 */
	public uint getNumGlyphs()
	{
		return gsk_text_node_get_num_glyphs(cast(GskRenderNode*)gskTextNode);
	}

	/**
	 * Retrieves the offset applied to the text.
	 *
	 * Returns: a point with the horizontal and vertical offsets
	 */
	public Point getOffset()
	{
		auto __p = gsk_text_node_get_offset(cast(GskRenderNode*)gskTextNode);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Point)(cast(graphene_point_t*) __p);
	}

	/**
	 * Checks whether the text @node has color glyphs.
	 *
	 * Returns: %TRUE if the text node has color glyphs
	 */
	public bool hasColorGlyphs()
	{
		return gsk_text_node_has_color_glyphs(cast(GskRenderNode*)gskTextNode) != 0;
	}
}
