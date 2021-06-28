module harfbuzz.buffer_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * The main structure holding the input text and its properties before shaping,
 * and output glyphs and their information after shaping.
 */
public struct buffer_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_buffer_get_type();
	}
}
