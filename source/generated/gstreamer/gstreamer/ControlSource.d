module gstreamer.ControlSource;

private import gstreamer.ObjectGst;
private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * The #GstControlSource is a base class for control value sources that could
 * be used to get timestamp-value pairs. A control source essentially is a
 * function over time.
 * 
 * A #GstControlSource is used by first getting an instance of a specific
 * control-source, creating a binding for the control-source to the target property
 * of the element and then adding the binding to the element. The binding will
 * convert the data types and value range to fit to the bound property.
 * 
 * For implementing a new #GstControlSource one has to implement
 * #GstControlSourceGetValue and #GstControlSourceGetValueArray functions.
 * These are then used by gst_control_source_get_value() and
 * gst_control_source_get_value_array() to get values for specific timestamps.
 */
public class ControlSource : ObjectGst
{
	/** the main Gtk struct */
	protected GstControlSource* gstControlSource;

	/** Get the main Gtk struct */
	public GstControlSource* getControlSourceStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstControlSource;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gstControlSource;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstControlSource* gstControlSource, bool ownedRef = false)
	{
		this.gstControlSource = gstControlSource;
		super(cast(GstObject*)gstControlSource, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gst_control_source_get_type();
	}

	/**
	 * Gets the value for this #GstControlSource at a given timestamp.
	 *
	 * Params:
	 *     timestamp = the time for which the value should be returned
	 *     value = the value
	 *
	 * Returns: %FALSE if the value couldn't be returned, %TRUE otherwise.
	 */
	public bool getValue(GstClockTime timestamp, out double value)
	{
		return gst_control_source_get_value(gstControlSource, timestamp, &value) != 0;
	}

	/**
	 * Gets an array of values for for this #GstControlSource. Values that are
	 * undefined contain NANs.
	 *
	 * Params:
	 *     timestamp = the first timestamp
	 *     interval = the time steps
	 *     values = array to put control-values in
	 *
	 * Returns: %TRUE if the given array could be filled, %FALSE otherwise
	 */
	public bool getValueArray(GstClockTime timestamp, GstClockTime interval, double[] values)
	{
		return gst_control_source_get_value_array(gstControlSource, timestamp, interval, cast(uint)values.length, values.ptr) != 0;
	}
}
