module gst.mpegts.DVBLinkageEvent;

private import glib.MemorySlice;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class DVBLinkageEvent
{
	/** the main Gtk struct */
	protected GstMpegtsDVBLinkageEvent* gstMpegtsDVBLinkageEvent;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsDVBLinkageEvent* getDVBLinkageEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsDVBLinkageEvent;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsDVBLinkageEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsDVBLinkageEvent* gstMpegtsDVBLinkageEvent, bool ownedRef = false)
	{
		this.gstMpegtsDVBLinkageEvent = gstMpegtsDVBLinkageEvent;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsDVBLinkageEvent);
	}


	/** */
	public @property ushort targetEventId()
	{
		return gstMpegtsDVBLinkageEvent.targetEventId;
	}

	/** Ditto */
	public @property void targetEventId(ushort value)
	{
		gstMpegtsDVBLinkageEvent.targetEventId = value;
	}

	/** */
	public @property bool targetListed()
	{
		return gstMpegtsDVBLinkageEvent.targetListed != 0;
	}

	/** Ditto */
	public @property void targetListed(bool value)
	{
		gstMpegtsDVBLinkageEvent.targetListed = value;
	}

	/** */
	public @property bool eventSimulcast()
	{
		return gstMpegtsDVBLinkageEvent.eventSimulcast != 0;
	}

	/** Ditto */
	public @property void eventSimulcast(bool value)
	{
		gstMpegtsDVBLinkageEvent.eventSimulcast = value;
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_dvb_linkage_event_get_type();
	}
}
