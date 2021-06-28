module gst.mpegts.AtscEIT;

private import glib.MemorySlice;
private import glib.PtrArray;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Event Information Table (ATSC)
 */
public final class AtscEIT
{
	/** the main Gtk struct */
	protected GstMpegtsAtscEIT* gstMpegtsAtscEIT;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsAtscEIT* getAtscEITStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsAtscEIT;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsAtscEIT;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsAtscEIT* gstMpegtsAtscEIT, bool ownedRef = false)
	{
		this.gstMpegtsAtscEIT = gstMpegtsAtscEIT;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsAtscEIT);
	}


	/**
	 * The source id
	 */
	public @property ushort sourceId()
	{
		return gstMpegtsAtscEIT.sourceId;
	}

	/** Ditto */
	public @property void sourceId(ushort value)
	{
		gstMpegtsAtscEIT.sourceId = value;
	}

	/**
	 * The protocol version
	 */
	public @property ubyte protocolVersion()
	{
		return gstMpegtsAtscEIT.protocolVersion;
	}

	/** Ditto */
	public @property void protocolVersion(ubyte value)
	{
		gstMpegtsAtscEIT.protocolVersion = value;
	}

	/**
	 * Events
	 */
	public @property PtrArray events()
	{
		return new PtrArray(gstMpegtsAtscEIT.events, false);
	}

	/** Ditto */
	public @property void events(PtrArray value)
	{
		gstMpegtsAtscEIT.events = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_atsc_eit_get_type();
	}
}
