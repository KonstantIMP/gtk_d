module gstreamer.FractionRange;

private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * A fundamental type that describes a #GstFractionRange range
 */
public class FractionRange
{
	/** the main Gtk struct */
	protected GstFractionRange* gstFractionRange;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstFractionRange* getFractionRangeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstFractionRange;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstFractionRange;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstFractionRange* gstFractionRange, bool ownedRef = false)
	{
		this.gstFractionRange = gstFractionRange;
		this.ownedRef = ownedRef;
	}


	/** */
	public static GType getType()
	{
		return gst_fraction_range_get_type();
	}
}
