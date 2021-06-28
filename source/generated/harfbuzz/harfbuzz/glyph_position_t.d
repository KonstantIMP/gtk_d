module harfbuzz.glyph_position_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * The #hb_glyph_position_t is the structure that holds the positions of the
 * glyph in both horizontal and vertical directions. All positions in
 * #hb_glyph_position_t are relative to the current point.
 */
public struct glyph_position_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_glyph_position_get_type();
	}
}
