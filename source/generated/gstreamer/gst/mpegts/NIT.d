module gst.mpegts.NIT;

private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.PtrArray;
private import gobject.ObjectG;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Network Information Table (ISO/IEC 13818-1 / EN 300 468)
 */
public final class NIT
{
	/** the main Gtk struct */
	protected GstMpegtsNIT* gstMpegtsNIT;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsNIT* getNITStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsNIT;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsNIT;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsNIT* gstMpegtsNIT, bool ownedRef = false)
	{
		this.gstMpegtsNIT = gstMpegtsNIT;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsNIT);
	}


	/**
	 * Whether this NIT corresponds to the actual stream
	 */
	public @property bool actualNetwork()
	{
		return gstMpegtsNIT.actualNetwork != 0;
	}

	/** Ditto */
	public @property void actualNetwork(bool value)
	{
		gstMpegtsNIT.actualNetwork = value;
	}

	/**
	 * ID of the network that this NIT describes
	 */
	public @property ushort networkId()
	{
		return gstMpegtsNIT.networkId;
	}

	/** Ditto */
	public @property void networkId(ushort value)
	{
		gstMpegtsNIT.networkId = value;
	}

	/**
	 * the global descriptors
	 */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsNIT.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsNIT.descriptors = value.getPtrArrayStruct();
	}

	/**
	 * the streams
	 */
	public @property PtrArray streams()
	{
		return new PtrArray(gstMpegtsNIT.streams, false);
	}

	/** Ditto */
	public @property void streams(PtrArray value)
	{
		gstMpegtsNIT.streams = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_nit_get_type();
	}

	/**
	 * Allocates and initializes a #GstMpegtsNIT.
	 *
	 * Returns: A newly allocated #GstMpegtsNIT
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gst_mpegts_nit_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstMpegtsNIT*) __p);
	}
}
