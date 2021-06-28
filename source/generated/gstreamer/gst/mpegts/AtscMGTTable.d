module gst.mpegts.AtscMGTTable;

private import glib.MemorySlice;
private import glib.PtrArray;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Source from a @GstMpegtsAtscMGT
 */
public final class AtscMGTTable
{
	/** the main Gtk struct */
	protected GstMpegtsAtscMGTTable* gstMpegtsAtscMGTTable;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsAtscMGTTable* getAtscMGTTableStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsAtscMGTTable;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsAtscMGTTable;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsAtscMGTTable* gstMpegtsAtscMGTTable, bool ownedRef = false)
	{
		this.gstMpegtsAtscMGTTable = gstMpegtsAtscMGTTable;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsAtscMGTTable);
	}


	/**
	 * #GstMpegtsAtscMGTTableType
	 */
	public @property ushort tableType()
	{
		return gstMpegtsAtscMGTTable.tableType;
	}

	/** Ditto */
	public @property void tableType(ushort value)
	{
		gstMpegtsAtscMGTTable.tableType = value;
	}

	/**
	 * The packet ID
	 */
	public @property ushort pid()
	{
		return gstMpegtsAtscMGTTable.pid;
	}

	/** Ditto */
	public @property void pid(ushort value)
	{
		gstMpegtsAtscMGTTable.pid = value;
	}

	/**
	 * The version number
	 */
	public @property ubyte versionNumber()
	{
		return gstMpegtsAtscMGTTable.versionNumber;
	}

	/** Ditto */
	public @property void versionNumber(ubyte value)
	{
		gstMpegtsAtscMGTTable.versionNumber = value;
	}

	/** */
	public @property uint numberBytes()
	{
		return gstMpegtsAtscMGTTable.numberBytes;
	}

	/** Ditto */
	public @property void numberBytes(uint value)
	{
		gstMpegtsAtscMGTTable.numberBytes = value;
	}

	/**
	 * descriptors
	 */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsAtscMGTTable.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsAtscMGTTable.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_atsc_mgt_table_get_type();
	}
}
