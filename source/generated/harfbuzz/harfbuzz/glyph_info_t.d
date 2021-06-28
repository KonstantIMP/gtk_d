module harfbuzz.glyph_info_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * The #hb_glyph_info_t is the structure that holds information about the
 * glyphs and their relation to input text.
 */
public struct glyph_info_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_glyph_info_get_type();
	}
}
