module gstreamer.DoubleRange;

private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * A fundamental type that describes a #gdouble range
 */
public class DoubleRange
{
	/** the main Gtk struct */
	protected GstDoubleRange* gstDoubleRange;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstDoubleRange* getDoubleRangeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstDoubleRange;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstDoubleRange;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstDoubleRange* gstDoubleRange, bool ownedRef = false)
	{
		this.gstDoubleRange = gstDoubleRange;
		this.ownedRef = ownedRef;
	}


	/** */
	public static GType getType()
	{
		return gst_double_range_get_type();
	}
}
