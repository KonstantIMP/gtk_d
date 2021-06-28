module harfbuzz.font_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * Data type for holding fonts.
 */
public struct font_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_font_get_type();
	}
}
