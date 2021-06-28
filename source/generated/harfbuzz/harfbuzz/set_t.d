module harfbuzz.set_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * Data type for holding a set of integers. #hb_set_t's are
 * used to gather and contain glyph IDs, Unicode code
 * points, and various other collections of discrete
 * values.
 */
public struct set_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_set_get_type();
	}
}
