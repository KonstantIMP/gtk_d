module gst.mpegts.LogicalChannel;

private import glib.MemorySlice;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class LogicalChannel
{
	/** the main Gtk struct */
	protected GstMpegtsLogicalChannel* gstMpegtsLogicalChannel;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsLogicalChannel* getLogicalChannelStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsLogicalChannel;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsLogicalChannel;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsLogicalChannel* gstMpegtsLogicalChannel, bool ownedRef = false)
	{
		this.gstMpegtsLogicalChannel = gstMpegtsLogicalChannel;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsLogicalChannel);
	}


	/** */
	public @property ushort serviceId()
	{
		return gstMpegtsLogicalChannel.serviceId;
	}

	/** Ditto */
	public @property void serviceId(ushort value)
	{
		gstMpegtsLogicalChannel.serviceId = value;
	}

	/** */
	public @property bool visibleService()
	{
		return gstMpegtsLogicalChannel.visibleService != 0;
	}

	/** Ditto */
	public @property void visibleService(bool value)
	{
		gstMpegtsLogicalChannel.visibleService = value;
	}

	/** */
	public @property ushort logicalChannelNumber()
	{
		return gstMpegtsLogicalChannel.logicalChannelNumber;
	}

	/** Ditto */
	public @property void logicalChannelNumber(ushort value)
	{
		gstMpegtsLogicalChannel.logicalChannelNumber = value;
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_logical_channel_get_type();
	}
}
