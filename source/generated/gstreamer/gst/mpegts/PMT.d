module gst.mpegts.PMT;

private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.PtrArray;
private import gobject.ObjectG;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Program Map Table (ISO/IEC 13818-1).
 * 
 * The program_number is contained in the subtable_extension field of the
 * container #GstMpegtsSection.
 */
public final class PMT
{
	/** the main Gtk struct */
	protected GstMpegtsPMT* gstMpegtsPMT;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsPMT* getPMTStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsPMT;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsPMT;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsPMT* gstMpegtsPMT, bool ownedRef = false)
	{
		this.gstMpegtsPMT = gstMpegtsPMT;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsPMT);
	}


	/**
	 * PID of the stream containing PCR
	 */
	public @property ushort pcrPid()
	{
		return gstMpegtsPMT.pcrPid;
	}

	/** Ditto */
	public @property void pcrPid(ushort value)
	{
		gstMpegtsPMT.pcrPid = value;
	}

	/** */
	public @property ushort programNumber()
	{
		return gstMpegtsPMT.programNumber;
	}

	/** Ditto */
	public @property void programNumber(ushort value)
	{
		gstMpegtsPMT.programNumber = value;
	}

	/**
	 * array of #GstMpegtsDescriptor
	 */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsPMT.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsPMT.descriptors = value.getPtrArrayStruct();
	}

	/**
	 * Array of #GstMpegtsPMTStream
	 */
	public @property PtrArray streams()
	{
		return new PtrArray(gstMpegtsPMT.streams, false);
	}

	/** Ditto */
	public @property void streams(PtrArray value)
	{
		gstMpegtsPMT.streams = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_pmt_get_type();
	}

	/**
	 * Allocates and initializes a new #GstMpegtsPMT.
	 *
	 * Returns: #GstMpegtsPMT
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gst_mpegts_pmt_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstMpegtsPMT*) __p);
	}
}
