module gst.mpegts.AtscETT;

private import glib.MemorySlice;
private import glib.PtrArray;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Extended Text Table (ATSC)
 */
public final class AtscETT
{
	/** the main Gtk struct */
	protected GstMpegtsAtscETT* gstMpegtsAtscETT;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsAtscETT* getAtscETTStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsAtscETT;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsAtscETT;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsAtscETT* gstMpegtsAtscETT, bool ownedRef = false)
	{
		this.gstMpegtsAtscETT = gstMpegtsAtscETT;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsAtscETT);
	}


	/** */
	public @property ushort ettTableIdExtension()
	{
		return gstMpegtsAtscETT.ettTableIdExtension;
	}

	/** Ditto */
	public @property void ettTableIdExtension(ushort value)
	{
		gstMpegtsAtscETT.ettTableIdExtension = value;
	}

	/**
	 * The protocol version
	 */
	public @property ushort protocolVersion()
	{
		return gstMpegtsAtscETT.protocolVersion;
	}

	/** Ditto */
	public @property void protocolVersion(ushort value)
	{
		gstMpegtsAtscETT.protocolVersion = value;
	}

	/**
	 * The etm id
	 */
	public @property uint etmId()
	{
		return gstMpegtsAtscETT.etmId;
	}

	/** Ditto */
	public @property void etmId(uint value)
	{
		gstMpegtsAtscETT.etmId = value;
	}

	/**
	 * List of texts
	 */
	public @property PtrArray messages()
	{
		return new PtrArray(gstMpegtsAtscETT.messages, false);
	}

	/** Ditto */
	public @property void messages(PtrArray value)
	{
		gstMpegtsAtscETT.messages = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_atsc_ett_get_type();
	}
}
