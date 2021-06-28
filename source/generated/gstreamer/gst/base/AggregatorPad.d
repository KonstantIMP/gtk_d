module gst.base.AggregatorPad;

private import gobject.ObjectG;
private import gobject.Signals;
private import gst.base.c.functions;
public  import gst.base.c.types;
private import gstreamer.Buffer;
private import gstreamer.Pad;
private import std.algorithm;


/**
 * Pads managed by a #GstAggregator subclass.
 * 
 * This class used to live in gst-plugins-bad and was moved to core.
 *
 * Since: 1.14
 */
public class AggregatorPad : Pad
{
	/** the main Gtk struct */
	protected GstAggregatorPad* gstAggregatorPad;

	/** Get the main Gtk struct */
	public GstAggregatorPad* getAggregatorPadStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstAggregatorPad;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gstAggregatorPad;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstAggregatorPad* gstAggregatorPad, bool ownedRef = false)
	{
		this.gstAggregatorPad = gstAggregatorPad;
		super(cast(GstPad*)gstAggregatorPad, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gst_aggregator_pad_get_type();
	}

	/**
	 * Drop the buffer currently queued in @pad.
	 *
	 * Returns: TRUE if there was a buffer queued in @pad, or FALSE if not.
	 */
	public bool dropBuffer()
	{
		return gst_aggregator_pad_drop_buffer(gstAggregatorPad) != 0;
	}

	/**
	 * This checks if a pad has a buffer available that will be returned by
	 * a call to gst_aggregator_pad_peek_buffer() or
	 * gst_aggregator_pad_pop_buffer().
	 *
	 * Returns: %TRUE if the pad has a buffer available as the next thing.
	 *
	 * Since: 1.14.1
	 */
	public bool hasBuffer()
	{
		return gst_aggregator_pad_has_buffer(gstAggregatorPad) != 0;
	}

	/**
	 * Returns: %TRUE if the pad is EOS, otherwise %FALSE.
	 */
	public bool isEos()
	{
		return gst_aggregator_pad_is_eos(gstAggregatorPad) != 0;
	}

	/**
	 * Returns: A reference to the buffer in @pad or
	 *     NULL if no buffer was queued. You should unref the buffer after
	 *     usage.
	 */
	public Buffer peekBuffer()
	{
		auto __p = gst_aggregator_pad_peek_buffer(gstAggregatorPad);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Buffer)(cast(GstBuffer*) __p, true);
	}

	/**
	 * Steal the ref to the buffer currently queued in @pad.
	 *
	 * Returns: The buffer in @pad or NULL if no buffer was
	 *     queued. You should unref the buffer after usage.
	 */
	public Buffer popBuffer()
	{
		auto __p = gst_aggregator_pad_pop_buffer(gstAggregatorPad);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Buffer)(cast(GstBuffer*) __p, true);
	}

	/** */
	gulong addOnBufferConsumed(void delegate(Buffer, AggregatorPad) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "buffer-consumed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
