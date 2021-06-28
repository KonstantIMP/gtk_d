module gst.mpegts.AtscStringSegment;

private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * A string segment
 */
public final class AtscStringSegment
{
	/** the main Gtk struct */
	protected GstMpegtsAtscStringSegment* gstMpegtsAtscStringSegment;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsAtscStringSegment* getAtscStringSegmentStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsAtscStringSegment;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsAtscStringSegment;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsAtscStringSegment* gstMpegtsAtscStringSegment, bool ownedRef = false)
	{
		this.gstMpegtsAtscStringSegment = gstMpegtsAtscStringSegment;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsAtscStringSegment);
	}


	/**
	 * The compression type
	 */
	public @property ubyte compressionType()
	{
		return gstMpegtsAtscStringSegment.compressionType;
	}

	/** Ditto */
	public @property void compressionType(ubyte value)
	{
		gstMpegtsAtscStringSegment.compressionType = value;
	}

	/**
	 * The mode
	 */
	public @property ubyte mode()
	{
		return gstMpegtsAtscStringSegment.mode;
	}

	/** Ditto */
	public @property void mode(ubyte value)
	{
		gstMpegtsAtscStringSegment.mode = value;
	}


	/**
	 * The compressed data
	 */
	public @property ubyte[] compressedData()
	{
		return gstMpegtsAtscStringSegment.compressedData[0..gstMpegtsAtscStringSegment.compressedDataSize];
	}

	/** Ditto */
	public @property void compressedData(ubyte[] value)
	{
		gstMpegtsAtscStringSegment.compressedData = value.ptr;
		gstMpegtsAtscStringSegment.compressedDataSize = cast(ubyte)value.length;
	}

	/** */
	public @property string cachedString()
	{
		return Str.toString(gstMpegtsAtscStringSegment.cachedString);
	}

	/** Ditto */
	public @property void cachedString(string value)
	{
		gstMpegtsAtscStringSegment.cachedString = Str.toStringz(value);
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_atsc_string_segment_get_type();
	}

	/** */
	public string getString()
	{
		return Str.toString(gst_mpegts_atsc_string_segment_get_string(gstMpegtsAtscStringSegment));
	}

	/** */
	public bool setString(string string_, ubyte compressionType, ubyte mode)
	{
		return gst_mpegts_atsc_string_segment_set_string(gstMpegtsAtscStringSegment, Str.toStringz(string_), compressionType, mode) != 0;
	}
}
