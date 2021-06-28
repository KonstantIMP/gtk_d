module harfbuzz.user_data_key_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * Data structure for holding user-data keys.
 */
public struct user_data_key_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_user_data_key_get_type();
	}
}
