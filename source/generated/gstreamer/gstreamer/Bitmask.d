module gstreamer.Bitmask;

private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * A fundamental type that describes a 64-bit bitmask
 */
public class Bitmask
{
	/** the main Gtk struct */
	protected GstBitmask* gstBitmask;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstBitmask* getBitmaskStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstBitmask;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstBitmask;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstBitmask* gstBitmask, bool ownedRef = false)
	{
		this.gstBitmask = gstBitmask;
		this.ownedRef = ownedRef;
	}


	/** */
	public static GType getType()
	{
		return gst_bitmask_get_type();
	}
}
