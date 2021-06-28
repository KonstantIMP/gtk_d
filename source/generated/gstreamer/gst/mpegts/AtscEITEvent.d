module gst.mpegts.AtscEITEvent;

private import glib.MemorySlice;
private import glib.PtrArray;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * An ATSC EIT Event
 */
public final class AtscEITEvent
{
	/** the main Gtk struct */
	protected GstMpegtsAtscEITEvent* gstMpegtsAtscEITEvent;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsAtscEITEvent* getAtscEITEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsAtscEITEvent;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsAtscEITEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsAtscEITEvent* gstMpegtsAtscEITEvent, bool ownedRef = false)
	{
		this.gstMpegtsAtscEITEvent = gstMpegtsAtscEITEvent;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsAtscEITEvent);
	}


	/**
	 * The event id
	 */
	public @property ushort eventId()
	{
		return gstMpegtsAtscEITEvent.eventId;
	}

	/** Ditto */
	public @property void eventId(ushort value)
	{
		gstMpegtsAtscEITEvent.eventId = value;
	}

	/**
	 * The start time
	 */
	public @property uint startTime()
	{
		return gstMpegtsAtscEITEvent.startTime;
	}

	/** Ditto */
	public @property void startTime(uint value)
	{
		gstMpegtsAtscEITEvent.startTime = value;
	}

	/**
	 * The etm location
	 */
	public @property ubyte etmLocation()
	{
		return gstMpegtsAtscEITEvent.etmLocation;
	}

	/** Ditto */
	public @property void etmLocation(ubyte value)
	{
		gstMpegtsAtscEITEvent.etmLocation = value;
	}

	/**
	 * The length in seconds
	 */
	public @property uint lengthInSeconds()
	{
		return gstMpegtsAtscEITEvent.lengthInSeconds;
	}

	/** Ditto */
	public @property void lengthInSeconds(uint value)
	{
		gstMpegtsAtscEITEvent.lengthInSeconds = value;
	}

	/**
	 * the titles
	 */
	public @property PtrArray titles()
	{
		return new PtrArray(gstMpegtsAtscEITEvent.titles, false);
	}

	/** Ditto */
	public @property void titles(PtrArray value)
	{
		gstMpegtsAtscEITEvent.titles = value.getPtrArrayStruct();
	}

	/**
	 * descriptors
	 */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsAtscEITEvent.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsAtscEITEvent.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_atsc_eit_event_get_type();
	}
}
