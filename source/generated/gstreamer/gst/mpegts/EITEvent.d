module gst.mpegts.EITEvent;

private import glib.MemorySlice;
private import glib.PtrArray;
private import gobject.ObjectG;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import gstreamer.DateTime;
private import linker.loader;


/**
 * Event from a @GstMpegtsEIT
 */
public final class EITEvent
{
	/** the main Gtk struct */
	protected GstMpegtsEITEvent* gstMpegtsEITEvent;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsEITEvent* getEITEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsEITEvent;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsEITEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsEITEvent* gstMpegtsEITEvent, bool ownedRef = false)
	{
		this.gstMpegtsEITEvent = gstMpegtsEITEvent;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsEITEvent);
	}


	/** */
	public @property ushort eventId()
	{
		return gstMpegtsEITEvent.eventId;
	}

	/** Ditto */
	public @property void eventId(ushort value)
	{
		gstMpegtsEITEvent.eventId = value;
	}

	/** */
	public @property DateTime startTime()
	{
		return ObjectG.getDObject!(DateTime)(gstMpegtsEITEvent.startTime, false);
	}

	/** Ditto */
	public @property void startTime(DateTime value)
	{
		gstMpegtsEITEvent.startTime = value.getDateTimeStruct();
	}

	/** */
	public @property uint duration()
	{
		return gstMpegtsEITEvent.duration;
	}

	/** Ditto */
	public @property void duration(uint value)
	{
		gstMpegtsEITEvent.duration = value;
	}

	/** */
	public @property GstMpegtsRunningStatus runningStatus()
	{
		return gstMpegtsEITEvent.runningStatus;
	}

	/** Ditto */
	public @property void runningStatus(GstMpegtsRunningStatus value)
	{
		gstMpegtsEITEvent.runningStatus = value;
	}

	/** */
	public @property bool freeCAMode()
	{
		return gstMpegtsEITEvent.freeCAMode != 0;
	}

	/** Ditto */
	public @property void freeCAMode(bool value)
	{
		gstMpegtsEITEvent.freeCAMode = value;
	}

	/**
	 * List of descriptors
	 */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsEITEvent.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsEITEvent.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_eit_event_get_type();
	}
}
