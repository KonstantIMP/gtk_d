module harfbuzz.map_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * Data type for holding integer-to-integer hash maps.
 */
public struct map_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_map_get_type();
	}
}
