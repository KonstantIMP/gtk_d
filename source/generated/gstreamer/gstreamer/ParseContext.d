module gstreamer.ParseContext;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gstreamer.c.functions;
public  import gstreamer.c.types;
private import linker.loader;


/**
 * Opaque structure.
 */
public class ParseContext
{
	/** the main Gtk struct */
	protected GstParseContext* gstParseContext;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstParseContext* getParseContextStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstParseContext;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstParseContext;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstParseContext* gstParseContext, bool ownedRef = false)
	{
		this.gstParseContext = gstParseContext;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTREAMER[0]) && ownedRef )
			gst_parse_context_free(gstParseContext);
	}


	/** */
	public static GType getType()
	{
		return gst_parse_context_get_type();
	}

	/**
	 * Allocates a parse context for use with gst_parse_launch_full() or
	 * gst_parse_launchv_full().
	 *
	 * Free-function: gst_parse_context_free
	 *
	 * Returns: a newly-allocated parse context. Free
	 *     with gst_parse_context_free() when no longer needed.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gst_parse_context_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstParseContext*) __p);
	}

	/**
	 * Copies the @context.
	 *
	 * Returns: A copied #GstParseContext
	 *
	 * Since: 1.12.1
	 */
	public ParseContext copy()
	{
		auto __p = gst_parse_context_copy(gstParseContext);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ParseContext)(cast(GstParseContext*) __p, true);
	}

	/**
	 * Frees a parse context previously allocated with gst_parse_context_new().
	 */
	public void free()
	{
		gst_parse_context_free(gstParseContext);
		ownedRef = false;
	}

	/**
	 * Retrieve missing elements from a previous run of gst_parse_launch_full()
	 * or gst_parse_launchv_full(). Will only return results if an error code
	 * of %GST_PARSE_ERROR_NO_SUCH_ELEMENT was returned.
	 *
	 * Returns: a
	 *     %NULL-terminated array of element factory name strings of missing
	 *     elements. Free with g_strfreev() when no longer needed.
	 */
	public string[] getMissingElements()
	{
		auto retStr = gst_parse_context_get_missing_elements(gstParseContext);

		scope(exit) Str.freeStringArray(retStr);
		return Str.toStringArray(retStr);
	}
}
