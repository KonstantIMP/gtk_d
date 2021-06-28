module harfbuzz.unicode_funcs_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * Data type containing a set of virtual methods used for
 * accessing various Unicode character properties.
 * 
 * HarfBuzz provides a default function for each of the
 * methods in #hb_unicode_funcs_t. Client programs can implement
 * their own replacements for the individual Unicode functions, as
 * needed, and replace the default by calling the setter for a
 * method.
 */
public struct unicode_funcs_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_unicode_funcs_get_type();
	}
}
