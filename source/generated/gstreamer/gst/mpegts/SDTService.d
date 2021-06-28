module gst.mpegts.SDTService;

private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.PtrArray;
private import gobject.ObjectG;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class SDTService
{
	/** the main Gtk struct */
	protected GstMpegtsSDTService* gstMpegtsSDTService;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsSDTService* getSDTServiceStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsSDTService;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsSDTService;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsSDTService* gstMpegtsSDTService, bool ownedRef = false)
	{
		this.gstMpegtsSDTService = gstMpegtsSDTService;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsSDTService);
	}


	/**
	 * The program number this table belongs to
	 */
	public @property ushort serviceId()
	{
		return gstMpegtsSDTService.serviceId;
	}

	/** Ditto */
	public @property void serviceId(ushort value)
	{
		gstMpegtsSDTService.serviceId = value;
	}

	/**
	 * EIT schedule information is present in this transport stream
	 */
	public @property bool EITScheduleFlag()
	{
		return gstMpegtsSDTService.EITScheduleFlag != 0;
	}

	/** Ditto */
	public @property void EITScheduleFlag(bool value)
	{
		gstMpegtsSDTService.EITScheduleFlag = value;
	}

	/**
	 * EIT present/following information is present in this transport stream
	 */
	public @property bool EITPresentFollowingFlag()
	{
		return gstMpegtsSDTService.EITPresentFollowingFlag != 0;
	}

	/** Ditto */
	public @property void EITPresentFollowingFlag(bool value)
	{
		gstMpegtsSDTService.EITPresentFollowingFlag = value;
	}

	/**
	 * Status of this service
	 */
	public @property GstMpegtsRunningStatus runningStatus()
	{
		return gstMpegtsSDTService.runningStatus;
	}

	/** Ditto */
	public @property void runningStatus(GstMpegtsRunningStatus value)
	{
		gstMpegtsSDTService.runningStatus = value;
	}

	/**
	 * True if one or more streams is controlled by a CA system
	 */
	public @property bool freeCAMode()
	{
		return gstMpegtsSDTService.freeCAMode != 0;
	}

	/** Ditto */
	public @property void freeCAMode(bool value)
	{
		gstMpegtsSDTService.freeCAMode = value;
	}

	/**
	 * List of descriptors
	 */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsSDTService.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsSDTService.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_sdt_service_get_type();
	}

	/**
	 * Allocates and initializes a #GstMpegtsSDTService.
	 *
	 * Returns: A newly allocated #GstMpegtsSDTService
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gst_mpegts_sdt_service_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstMpegtsSDTService*) __p);
	}
}
