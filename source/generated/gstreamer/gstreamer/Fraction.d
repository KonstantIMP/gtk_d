module gstreamer.Fraction;

private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * A fundamental type that describes a fraction of an integer numerator
 * over an integer denominator
 */
public class Fraction
{
	/** the main Gtk struct */
	protected GstFraction* gstFraction;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstFraction* getFractionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstFraction;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstFraction;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstFraction* gstFraction, bool ownedRef = false)
	{
		this.gstFraction = gstFraction;
		this.ownedRef = ownedRef;
	}


	/** */
	public static GType getType()
	{
		return gst_fraction_get_type();
	}
}
