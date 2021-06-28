module gst.mpegts.DVBLinkageExtendedEvent;

private import glib.MemorySlice;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class DVBLinkageExtendedEvent
{
	/** the main Gtk struct */
	protected GstMpegtsDVBLinkageExtendedEvent* gstMpegtsDVBLinkageExtendedEvent;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsDVBLinkageExtendedEvent* getDVBLinkageExtendedEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsDVBLinkageExtendedEvent;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsDVBLinkageExtendedEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsDVBLinkageExtendedEvent* gstMpegtsDVBLinkageExtendedEvent, bool ownedRef = false)
	{
		this.gstMpegtsDVBLinkageExtendedEvent = gstMpegtsDVBLinkageExtendedEvent;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsDVBLinkageExtendedEvent);
	}


	/** */
	public @property ushort targetEventId()
	{
		return gstMpegtsDVBLinkageExtendedEvent.targetEventId;
	}

	/** Ditto */
	public @property void targetEventId(ushort value)
	{
		gstMpegtsDVBLinkageExtendedEvent.targetEventId = value;
	}

	/** */
	public @property bool targetListed()
	{
		return gstMpegtsDVBLinkageExtendedEvent.targetListed != 0;
	}

	/** Ditto */
	public @property void targetListed(bool value)
	{
		gstMpegtsDVBLinkageExtendedEvent.targetListed = value;
	}

	/** */
	public @property bool eventSimulcast()
	{
		return gstMpegtsDVBLinkageExtendedEvent.eventSimulcast != 0;
	}

	/** Ditto */
	public @property void eventSimulcast(bool value)
	{
		gstMpegtsDVBLinkageExtendedEvent.eventSimulcast = value;
	}

	/** */
	public @property ubyte linkType()
	{
		return gstMpegtsDVBLinkageExtendedEvent.linkType;
	}

	/** Ditto */
	public @property void linkType(ubyte value)
	{
		gstMpegtsDVBLinkageExtendedEvent.linkType = value;
	}

	/** */
	public @property ubyte targetIdType()
	{
		return gstMpegtsDVBLinkageExtendedEvent.targetIdType;
	}

	/** Ditto */
	public @property void targetIdType(ubyte value)
	{
		gstMpegtsDVBLinkageExtendedEvent.targetIdType = value;
	}

	/** */
	public @property bool originalNetworkIdFlag()
	{
		return gstMpegtsDVBLinkageExtendedEvent.originalNetworkIdFlag != 0;
	}

	/** Ditto */
	public @property void originalNetworkIdFlag(bool value)
	{
		gstMpegtsDVBLinkageExtendedEvent.originalNetworkIdFlag = value;
	}

	/** */
	public @property bool serviceIdFlag()
	{
		return gstMpegtsDVBLinkageExtendedEvent.serviceIdFlag != 0;
	}

	/** Ditto */
	public @property void serviceIdFlag(bool value)
	{
		gstMpegtsDVBLinkageExtendedEvent.serviceIdFlag = value;
	}

	/** */
	public @property ushort userDefinedId()
	{
		return gstMpegtsDVBLinkageExtendedEvent.userDefinedId;
	}

	/** Ditto */
	public @property void userDefinedId(ushort value)
	{
		gstMpegtsDVBLinkageExtendedEvent.userDefinedId = value;
	}

	/** */
	public @property ushort targetTransportStreamId()
	{
		return gstMpegtsDVBLinkageExtendedEvent.targetTransportStreamId;
	}

	/** Ditto */
	public @property void targetTransportStreamId(ushort value)
	{
		gstMpegtsDVBLinkageExtendedEvent.targetTransportStreamId = value;
	}

	/** */
	public @property ushort targetOriginalNetworkId()
	{
		return gstMpegtsDVBLinkageExtendedEvent.targetOriginalNetworkId;
	}

	/** Ditto */
	public @property void targetOriginalNetworkId(ushort value)
	{
		gstMpegtsDVBLinkageExtendedEvent.targetOriginalNetworkId = value;
	}

	/** */
	public @property ushort targetServiceId()
	{
		return gstMpegtsDVBLinkageExtendedEvent.targetServiceId;
	}

	/** Ditto */
	public @property void targetServiceId(ushort value)
	{
		gstMpegtsDVBLinkageExtendedEvent.targetServiceId = value;
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_dvb_linkage_extended_event_get_type();
	}
}
