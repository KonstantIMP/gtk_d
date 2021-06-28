module gst.mpegts.SDT;

private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.PtrArray;
private import gobject.ObjectG;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Service Description Table (EN 300 468)
 */
public final class SDT
{
	/** the main Gtk struct */
	protected GstMpegtsSDT* gstMpegtsSDT;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsSDT* getSDTStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsSDT;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsSDT;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsSDT* gstMpegtsSDT, bool ownedRef = false)
	{
		this.gstMpegtsSDT = gstMpegtsSDT;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsSDT);
	}


	/**
	 * Network ID of the originating delivery system
	 */
	public @property ushort originalNetworkId()
	{
		return gstMpegtsSDT.originalNetworkId;
	}

	/** Ditto */
	public @property void originalNetworkId(ushort value)
	{
		gstMpegtsSDT.originalNetworkId = value;
	}

	/**
	 * True if the table describes this transport stream
	 */
	public @property bool actualTs()
	{
		return gstMpegtsSDT.actualTs != 0;
	}

	/** Ditto */
	public @property void actualTs(bool value)
	{
		gstMpegtsSDT.actualTs = value;
	}

	/**
	 * ID of this transport stream
	 */
	public @property ushort transportStreamId()
	{
		return gstMpegtsSDT.transportStreamId;
	}

	/** Ditto */
	public @property void transportStreamId(ushort value)
	{
		gstMpegtsSDT.transportStreamId = value;
	}

	/**
	 * List of services
	 */
	public @property PtrArray services()
	{
		return new PtrArray(gstMpegtsSDT.services, false);
	}

	/** Ditto */
	public @property void services(PtrArray value)
	{
		gstMpegtsSDT.services = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_sdt_get_type();
	}

	/**
	 * Allocates and initializes a #GstMpegtsSDT.
	 *
	 * Returns: A newly allocated #GstMpegtsSDT
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gst_mpegts_sdt_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstMpegtsSDT*) __p);
	}
}
