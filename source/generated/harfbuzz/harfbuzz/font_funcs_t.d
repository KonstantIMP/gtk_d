module harfbuzz.font_funcs_t;

private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * Data type containing a set of virtual methods used for
 * working on #hb_font_t font objects.
 * 
 * HarfBuzz provides a lightweight default function for each of
 * the methods in #hb_font_funcs_t. Client programs can implement
 * their own replacements for the individual font functions, as
 * needed, and replace the default by calling the setter for a
 * method.
 */
public struct font_funcs_t
{

	/** */
	public static GType getType()
	{
		return hb_gobject_font_funcs_get_type();
	}
}
