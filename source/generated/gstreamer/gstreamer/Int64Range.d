module gstreamer.Int64Range;

private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * A fundamental type that describes a #gint64 range
 */
public class Int64Range
{
	/** the main Gtk struct */
	protected GstInt64Range* gstInt64Range;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstInt64Range* getInt64RangeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstInt64Range;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstInt64Range;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstInt64Range* gstInt64Range, bool ownedRef = false)
	{
		this.gstInt64Range = gstInt64Range;
		this.ownedRef = ownedRef;
	}


	/** */
	public static GType getType()
	{
		return gst_int64_range_get_type();
	}
}
