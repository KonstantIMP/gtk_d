module harfbuzz.segment_properties_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * The structure that holds various text properties of an #hb_buffer_t. Can be
 * set and retrieved using hb_buffer_set_segment_properties() and
 * hb_buffer_get_segment_properties(), respectively.
 */
public struct segment_properties_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_segment_properties_get_type();
	}
}
