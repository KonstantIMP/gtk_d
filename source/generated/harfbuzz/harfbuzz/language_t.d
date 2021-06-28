module harfbuzz.language_t;

private import glib.Str;
private import glib.c.functions;
private import harfbuzz.c.functions;
public  import harfbuzz.c.types;


/**
 * Data type for languages. Each #hb_language_t corresponds to a BCP 47
 * language tag.
 */
public class language_t
{
	/** the main Gtk struct */
	protected hb_language_t* hb_language;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public hb_language_t* getlanguage_tStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return hb_language;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)hb_language;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (hb_language_t* hb_language, bool ownedRef = false)
	{
		this.hb_language = hb_language;
		this.ownedRef = ownedRef;
	}


	/**
	 * Converts an #hb_language_t to a string.
	 *
	 * Returns: A %NULL-terminated string representing the @language. Must not be freed by
	 *     the caller.
	 *
	 * Since: 0.9.2
	 */
	public string String()
	{
		return Str.toString(hb_language_to_string(hb_language));
	}
}
