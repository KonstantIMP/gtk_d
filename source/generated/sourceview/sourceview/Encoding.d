module sourceview.Encoding;

private import glib.ListSG;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import linker.loader;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class Encoding
{
	/** the main Gtk struct */
	protected GtkSourceEncoding* gtkSourceEncoding;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GtkSourceEncoding* getEncodingStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceEncoding;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gtkSourceEncoding;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceEncoding* gtkSourceEncoding, bool ownedRef = false)
	{
		this.gtkSourceEncoding = gtkSourceEncoding;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_SOURCEVIEW[0]) && ownedRef )
			gtk_source_encoding_free(gtkSourceEncoding);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_encoding_get_type();
	}

	/**
	 * Used by language bindings.
	 *
	 * Returns: a copy of @enc.
	 *
	 * Since: 3.14
	 */
	public Encoding copy()
	{
		auto __p = gtk_source_encoding_copy(gtkSourceEncoding);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Encoding)(cast(GtkSourceEncoding*) __p, true);
	}

	/**
	 * Used by language bindings.
	 *
	 * Since: 3.14
	 */
	public void free()
	{
		gtk_source_encoding_free(gtkSourceEncoding);
		ownedRef = false;
	}

	/**
	 * Gets the character set of the #GtkSourceEncoding, such as "UTF-8" or
	 * "ISO-8859-1".
	 *
	 * Returns: the character set of the #GtkSourceEncoding.
	 *
	 * Since: 3.14
	 */
	public string getCharset()
	{
		return Str.toString(gtk_source_encoding_get_charset(gtkSourceEncoding));
	}

	/**
	 * Gets the name of the #GtkSourceEncoding such as "Unicode" or "Western".
	 *
	 * Returns: the name of the #GtkSourceEncoding.
	 *
	 * Since: 3.14
	 */
	public string getName()
	{
		return Str.toString(gtk_source_encoding_get_name(gtkSourceEncoding));
	}

	/**
	 * Returns: a string representation. Free with g_free() when no longer needed.
	 *
	 * Since: 3.14
	 */
	public override string toString()
	{
		auto retStr = gtk_source_encoding_to_string(gtkSourceEncoding);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Gets all encodings.
	 *
	 * Returns: a list of
	 *     all #GtkSourceEncoding's. Free with g_slist_free().
	 *
	 * Since: 3.14
	 */
	public static ListSG getAll()
	{
		auto __p = gtk_source_encoding_get_all();

		if(__p is null)
		{
			return null;
		}

		return new ListSG(cast(GSList*) __p);
	}

	/**
	 * Gets the #GtkSourceEncoding for the current locale. See also g_get_charset().
	 *
	 * Returns: the current locale encoding.
	 *
	 * Since: 3.14
	 */
	public static Encoding getCurrent()
	{
		auto __p = gtk_source_encoding_get_current();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Encoding)(cast(GtkSourceEncoding*) __p);
	}

	/**
	 * Gets the list of default candidate encodings to try when loading a file. See
	 * gtk_source_file_loader_set_candidate_encodings().
	 *
	 * This function returns a different list depending on the current locale (i.e.
	 * language, country and default encoding). The UTF-8 encoding and the current
	 * locale encoding are guaranteed to be present in the returned list.
	 *
	 * Returns: the list of
	 *     default candidate encodings. Free with g_slist_free().
	 *
	 * Since: 3.18
	 */
	public static ListSG getDefaultCandidates()
	{
		auto __p = gtk_source_encoding_get_default_candidates();

		if(__p is null)
		{
			return null;
		}

		return new ListSG(cast(GSList*) __p);
	}

	/**
	 * Gets a #GtkSourceEncoding from a character set such as "UTF-8" or
	 * "ISO-8859-1".
	 *
	 * Params:
	 *     charset = a character set.
	 *
	 * Returns: the corresponding #GtkSourceEncoding, or %NULL
	 *     if not found.
	 *
	 * Since: 3.14
	 */
	public static Encoding getFromCharset(string charset)
	{
		auto __p = gtk_source_encoding_get_from_charset(Str.toStringz(charset));

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Encoding)(cast(GtkSourceEncoding*) __p);
	}

	/**
	 * Returns: the UTF-8 encoding.
	 *
	 * Since: 3.14
	 */
	public static Encoding getUtf8()
	{
		auto __p = gtk_source_encoding_get_utf8();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Encoding)(cast(GtkSourceEncoding*) __p);
	}
}
