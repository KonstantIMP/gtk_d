module gst.mpegts.PMTStream;

private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.PtrArray;
private import gobject.ObjectG;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * An individual stream definition.
 */
public final class PMTStream
{
	/** the main Gtk struct */
	protected GstMpegtsPMTStream* gstMpegtsPMTStream;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsPMTStream* getPMTStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsPMTStream;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsPMTStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsPMTStream* gstMpegtsPMTStream, bool ownedRef = false)
	{
		this.gstMpegtsPMTStream = gstMpegtsPMTStream;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsPMTStream);
	}


	/**
	 * the type of stream. See #GstMpegtsStreamType
	 */
	public @property ubyte streamType()
	{
		return gstMpegtsPMTStream.streamType;
	}

	/** Ditto */
	public @property void streamType(ubyte value)
	{
		gstMpegtsPMTStream.streamType = value;
	}

	/**
	 * the PID of the stream
	 */
	public @property ushort pid()
	{
		return gstMpegtsPMTStream.pid;
	}

	/** Ditto */
	public @property void pid(ushort value)
	{
		gstMpegtsPMTStream.pid = value;
	}

	/**
	 * the descriptors of the
	 * stream
	 */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsPMTStream.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsPMTStream.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_pmt_stream_get_type();
	}

	/**
	 * Allocates and initializes a new #GstMpegtsPMTStream.
	 *
	 * Returns: #GstMpegtsPMTStream
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gst_mpegts_pmt_stream_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstMpegtsPMTStream*) __p);
	}
}
