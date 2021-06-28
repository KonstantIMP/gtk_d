module gstreamer.DebugCategory;

private import glib.Str;
private import glib.c.functions;
private import gstreamer.c.functions;
public  import gstreamer.c.types;
private import linker.loader;


/**
 * This is the struct that describes the categories. Once initialized with
 * #GST_DEBUG_CATEGORY_INIT, its values can't be changed anymore.
 */
public class DebugCategory
{
	/** the main Gtk struct */
	protected GstDebugCategory* gstDebugCategory;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstDebugCategory* getDebugCategoryStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstDebugCategory;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstDebugCategory;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstDebugCategory* gstDebugCategory, bool ownedRef = false)
	{
		this.gstDebugCategory = gstDebugCategory;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTREAMER[0]) && ownedRef )
			gst_debug_category_free(gstDebugCategory);
	}


	/**
	 * Removes and frees the category and all associated resources.
	 *
	 * Deprecated: This function can easily cause memory corruption, don't use it.
	 */
	public void free()
	{
		gst_debug_category_free(gstDebugCategory);
		ownedRef = false;
	}

	/**
	 * Returns the color of a debug category used when printing output in this
	 * category.
	 *
	 * Returns: the color of the category.
	 */
	public uint getColor()
	{
		return gst_debug_category_get_color(gstDebugCategory);
	}

	/**
	 * Returns the description of a debug category.
	 *
	 * Returns: the description of the category.
	 */
	public string getDescription()
	{
		return Str.toString(gst_debug_category_get_description(gstDebugCategory));
	}

	/**
	 * Returns the name of a debug category.
	 *
	 * Returns: the name of the category.
	 */
	public string getName()
	{
		return Str.toString(gst_debug_category_get_name(gstDebugCategory));
	}

	/**
	 * Returns the threshold of a #GstDebugCategory.
	 *
	 * Returns: the #GstDebugLevel that is used as threshold.
	 */
	public GstDebugLevel getThreshold()
	{
		return gst_debug_category_get_threshold(gstDebugCategory);
	}

	/**
	 * Resets the threshold of the category to the default level. Debug information
	 * will only be output if the threshold is lower or equal to the level of the
	 * debugging message.
	 * Use this function to set the threshold back to where it was after using
	 * gst_debug_category_set_threshold().
	 */
	public void resetThreshold()
	{
		gst_debug_category_reset_threshold(gstDebugCategory);
	}

	/**
	 * Sets the threshold of the category to the given level. Debug information will
	 * only be output if the threshold is lower or equal to the level of the
	 * debugging message.
	 * > Do not use this function in production code, because other functions may
	 * > change the threshold of categories as side effect. It is however a nice
	 * > function to use when debugging (even from gdb).
	 *
	 * Params:
	 *     level = the #GstDebugLevel threshold to set.
	 */
	public void setThreshold(GstDebugLevel level)
	{
		gst_debug_category_set_threshold(gstDebugCategory, level);
	}
}
