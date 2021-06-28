module gst.mpegts.AtscVCT;

private import glib.MemorySlice;
private import glib.PtrArray;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Represents both:
 * Terrestrial Virtual Channel Table (A65)
 * Cable Virtual Channel Table (A65)
 */
public final class AtscVCT
{
	/** the main Gtk struct */
	protected GstMpegtsAtscVCT* gstMpegtsAtscVCT;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsAtscVCT* getAtscVCTStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsAtscVCT;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsAtscVCT;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsAtscVCT* gstMpegtsAtscVCT, bool ownedRef = false)
	{
		this.gstMpegtsAtscVCT = gstMpegtsAtscVCT;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsAtscVCT);
	}


	/**
	 * The transport stream
	 */
	public @property ushort transportStreamId()
	{
		return gstMpegtsAtscVCT.transportStreamId;
	}

	/** Ditto */
	public @property void transportStreamId(ushort value)
	{
		gstMpegtsAtscVCT.transportStreamId = value;
	}

	/**
	 * The protocol version
	 */
	public @property ubyte protocolVersion()
	{
		return gstMpegtsAtscVCT.protocolVersion;
	}

	/** Ditto */
	public @property void protocolVersion(ubyte value)
	{
		gstMpegtsAtscVCT.protocolVersion = value;
	}

	/**
	 * sources
	 */
	public @property PtrArray sources()
	{
		return new PtrArray(gstMpegtsAtscVCT.sources, false);
	}

	/** Ditto */
	public @property void sources(PtrArray value)
	{
		gstMpegtsAtscVCT.sources = value.getPtrArrayStruct();
	}

	/**
	 * descriptors
	 */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsAtscVCT.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsAtscVCT.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_atsc_vct_get_type();
	}
}
