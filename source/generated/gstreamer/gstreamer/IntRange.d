module gstreamer.IntRange;

private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * A fundamental type that describes a #gint range
 */
public class IntRange
{
	/** the main Gtk struct */
	protected GstIntRange* gstIntRange;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstIntRange* getIntRangeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstIntRange;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstIntRange;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstIntRange* gstIntRange, bool ownedRef = false)
	{
		this.gstIntRange = gstIntRange;
		this.ownedRef = ownedRef;
	}


	/** */
	public static GType getType()
	{
		return gst_int_range_get_type();
	}
}
