module gst.mpegts.LogicalChannelDescriptor;

private import glib.MemorySlice;
private import gobject.ObjectG;
private import gst.mpegts.LogicalChannel;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class LogicalChannelDescriptor
{
	/** the main Gtk struct */
	protected GstMpegtsLogicalChannelDescriptor* gstMpegtsLogicalChannelDescriptor;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsLogicalChannelDescriptor* getLogicalChannelDescriptorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsLogicalChannelDescriptor;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsLogicalChannelDescriptor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsLogicalChannelDescriptor* gstMpegtsLogicalChannelDescriptor, bool ownedRef = false)
	{
		this.gstMpegtsLogicalChannelDescriptor = gstMpegtsLogicalChannelDescriptor;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsLogicalChannelDescriptor);
	}


	/** */
	public @property uint nbChannels()
	{
		return gstMpegtsLogicalChannelDescriptor.nbChannels;
	}

	/** Ditto */
	public @property void nbChannels(uint value)
	{
		gstMpegtsLogicalChannelDescriptor.nbChannels = value;
	}

	/** */
	public @property LogicalChannel[64] channels()
	{
		LogicalChannel[64] arr;
		for ( int i = 0; i < arr.length; i++ )
		{
			arr[i] = ObjectG.getDObject!(LogicalChannel)(&(gstMpegtsLogicalChannelDescriptor.channels[i]), false);
		}

		return arr;
	}

	/** Ditto */
	public @property void channels(LogicalChannel[64] value)
	{
		for ( int i = 0; i < value.length; i++ )
		{
			gstMpegtsLogicalChannelDescriptor.channels[i] = *(value[i].getLogicalChannelStruct());
		}
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_logical_channel_descriptor_get_type();
	}
}
