module gstreamer.FlagSet;

private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * A fundamental type that describes a 32-bit flag bitfield, with 32-bit
 * mask indicating which of the bits in the field are explicitly set.
 */
public class FlagSet
{
	/** the main Gtk struct */
	protected GstFlagSet* gstFlagSet;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstFlagSet* getFlagSetStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstFlagSet;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstFlagSet;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstFlagSet* gstFlagSet, bool ownedRef = false)
	{
		this.gstFlagSet = gstFlagSet;
		this.ownedRef = ownedRef;
	}


	/** */
	public static GType getType()
	{
		return gst_flagset_get_type();
	}

	/**
	 * Create a new sub-class of #GST_TYPE_FLAG_SET
	 * which will pretty-print the human-readable flags
	 * when serializing, for easier debugging.
	 *
	 * Params:
	 *     flagsType = a #GType of a #G_TYPE_FLAGS type.
	 *
	 * Since: 1.6
	 */
	public static GType register(GType flagsType)
	{
		return gst_flagset_register(flagsType);
	}
}
