module gst.mpegts.AtscSTT;

private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.PtrArray;
private import gobject.ObjectG;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import gstreamer.DateTime;
private import linker.loader;


/**
 * System Time Table (A65)
 */
public final class AtscSTT
{
	/** the main Gtk struct */
	protected GstMpegtsAtscSTT* gstMpegtsAtscSTT;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsAtscSTT* getAtscSTTStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsAtscSTT;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsAtscSTT;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsAtscSTT* gstMpegtsAtscSTT, bool ownedRef = false)
	{
		this.gstMpegtsAtscSTT = gstMpegtsAtscSTT;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsAtscSTT);
	}


	/**
	 * The protocol version
	 */
	public @property ubyte protocolVersion()
	{
		return gstMpegtsAtscSTT.protocolVersion;
	}

	/** Ditto */
	public @property void protocolVersion(ubyte value)
	{
		gstMpegtsAtscSTT.protocolVersion = value;
	}

	/**
	 * The system time
	 */
	public @property uint systemTime()
	{
		return gstMpegtsAtscSTT.systemTime;
	}

	/** Ditto */
	public @property void systemTime(uint value)
	{
		gstMpegtsAtscSTT.systemTime = value;
	}

	/**
	 * The GPS to UTC offset
	 */
	public @property ubyte gpsUtcOffset()
	{
		return gstMpegtsAtscSTT.gpsUtcOffset;
	}

	/** Ditto */
	public @property void gpsUtcOffset(ubyte value)
	{
		gstMpegtsAtscSTT.gpsUtcOffset = value;
	}

	/** */
	public @property bool dsStatus()
	{
		return gstMpegtsAtscSTT.dsStatus != 0;
	}

	/** Ditto */
	public @property void dsStatus(bool value)
	{
		gstMpegtsAtscSTT.dsStatus = value;
	}

	/**
	 * The day of month
	 */
	public @property ubyte dsDayofmonth()
	{
		return gstMpegtsAtscSTT.dsDayofmonth;
	}

	/** Ditto */
	public @property void dsDayofmonth(ubyte value)
	{
		gstMpegtsAtscSTT.dsDayofmonth = value;
	}

	/**
	 * The hour
	 */
	public @property ubyte dsHour()
	{
		return gstMpegtsAtscSTT.dsHour;
	}

	/** Ditto */
	public @property void dsHour(ubyte value)
	{
		gstMpegtsAtscSTT.dsHour = value;
	}

	/**
	 * descriptors
	 */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsAtscSTT.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsAtscSTT.descriptors = value.getPtrArrayStruct();
	}

	/**
	 * The UTC date and time
	 */
	public @property DateTime utcDatetime()
	{
		return ObjectG.getDObject!(DateTime)(gstMpegtsAtscSTT.utcDatetime, false);
	}

	/** Ditto */
	public @property void utcDatetime(DateTime value)
	{
		gstMpegtsAtscSTT.utcDatetime = value.getDateTimeStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_atsc_stt_get_type();
	}

	/** */
	public this()
	{
		auto __p = gst_mpegts_atsc_stt_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstMpegtsAtscSTT*) __p);
	}

	/** */
	public DateTime getDatetimeUtc()
	{
		auto __p = gst_mpegts_atsc_stt_get_datetime_utc(gstMpegtsAtscSTT);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DateTime)(cast(GstDateTime*) __p, true);
	}
}
