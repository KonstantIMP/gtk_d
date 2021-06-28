module gst.mpegts.EIT;

private import glib.MemorySlice;
private import glib.PtrArray;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Event Information Table (EN 300 468)
 */
public final class EIT
{
	/** the main Gtk struct */
	protected GstMpegtsEIT* gstMpegtsEIT;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsEIT* getEITStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsEIT;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsEIT;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsEIT* gstMpegtsEIT, bool ownedRef = false)
	{
		this.gstMpegtsEIT = gstMpegtsEIT;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsEIT);
	}


	/** */
	public @property ushort transportStreamId()
	{
		return gstMpegtsEIT.transportStreamId;
	}

	/** Ditto */
	public @property void transportStreamId(ushort value)
	{
		gstMpegtsEIT.transportStreamId = value;
	}

	/** */
	public @property ushort originalNetworkId()
	{
		return gstMpegtsEIT.originalNetworkId;
	}

	/** Ditto */
	public @property void originalNetworkId(ushort value)
	{
		gstMpegtsEIT.originalNetworkId = value;
	}

	/** */
	public @property ubyte segmentLastSectionNumber()
	{
		return gstMpegtsEIT.segmentLastSectionNumber;
	}

	/** Ditto */
	public @property void segmentLastSectionNumber(ubyte value)
	{
		gstMpegtsEIT.segmentLastSectionNumber = value;
	}

	/** */
	public @property ubyte lastTableId()
	{
		return gstMpegtsEIT.lastTableId;
	}

	/** Ditto */
	public @property void lastTableId(ubyte value)
	{
		gstMpegtsEIT.lastTableId = value;
	}

	/** */
	public @property bool actualStream()
	{
		return gstMpegtsEIT.actualStream != 0;
	}

	/** Ditto */
	public @property void actualStream(bool value)
	{
		gstMpegtsEIT.actualStream = value;
	}

	/** */
	public @property bool presentFollowing()
	{
		return gstMpegtsEIT.presentFollowing != 0;
	}

	/** Ditto */
	public @property void presentFollowing(bool value)
	{
		gstMpegtsEIT.presentFollowing = value;
	}

	/**
	 * List of events
	 */
	public @property PtrArray events()
	{
		return new PtrArray(gstMpegtsEIT.events, false);
	}

	/** Ditto */
	public @property void events(PtrArray value)
	{
		gstMpegtsEIT.events = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_eit_get_type();
	}
}
