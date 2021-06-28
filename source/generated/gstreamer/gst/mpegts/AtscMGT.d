module gst.mpegts.AtscMGT;

private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.PtrArray;
private import gobject.ObjectG;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Master Guide Table (A65)
 */
public final class AtscMGT
{
	/** the main Gtk struct */
	protected GstMpegtsAtscMGT* gstMpegtsAtscMGT;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsAtscMGT* getAtscMGTStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsAtscMGT;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsAtscMGT;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsAtscMGT* gstMpegtsAtscMGT, bool ownedRef = false)
	{
		this.gstMpegtsAtscMGT = gstMpegtsAtscMGT;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsAtscMGT);
	}


	/**
	 * The protocol version
	 */
	public @property ubyte protocolVersion()
	{
		return gstMpegtsAtscMGT.protocolVersion;
	}

	/** Ditto */
	public @property void protocolVersion(ubyte value)
	{
		gstMpegtsAtscMGT.protocolVersion = value;
	}

	/**
	 * The numbers of subtables
	 */
	public @property ushort tablesDefined()
	{
		return gstMpegtsAtscMGT.tablesDefined;
	}

	/** Ditto */
	public @property void tablesDefined(ushort value)
	{
		gstMpegtsAtscMGT.tablesDefined = value;
	}

	/**
	 * the tables
	 */
	public @property PtrArray tables()
	{
		return new PtrArray(gstMpegtsAtscMGT.tables, false);
	}

	/** Ditto */
	public @property void tables(PtrArray value)
	{
		gstMpegtsAtscMGT.tables = value.getPtrArrayStruct();
	}

	/**
	 * descriptors
	 */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsAtscMGT.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsAtscMGT.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_atsc_mgt_get_type();
	}

	/** */
	public this()
	{
		auto __p = gst_mpegts_atsc_mgt_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstMpegtsAtscMGT*) __p);
	}
}
