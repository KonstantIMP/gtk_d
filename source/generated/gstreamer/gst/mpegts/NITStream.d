module gst.mpegts.NITStream;

private import glib.ConstructionException;
private import glib.MemorySlice;
private import glib.PtrArray;
private import gobject.ObjectG;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class NITStream
{
	/** the main Gtk struct */
	protected GstMpegtsNITStream* gstMpegtsNITStream;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsNITStream* getNITStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsNITStream;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsNITStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsNITStream* gstMpegtsNITStream, bool ownedRef = false)
	{
		this.gstMpegtsNITStream = gstMpegtsNITStream;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsNITStream);
	}


	/** */
	public @property ushort transportStreamId()
	{
		return gstMpegtsNITStream.transportStreamId;
	}

	/** Ditto */
	public @property void transportStreamId(ushort value)
	{
		gstMpegtsNITStream.transportStreamId = value;
	}

	/** */
	public @property ushort originalNetworkId()
	{
		return gstMpegtsNITStream.originalNetworkId;
	}

	/** Ditto */
	public @property void originalNetworkId(ushort value)
	{
		gstMpegtsNITStream.originalNetworkId = value;
	}

	/** */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsNITStream.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsNITStream.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_nit_stream_get_type();
	}

	/**
	 * Allocates and initializes a #GstMpegtsNITStream
	 *
	 * Returns: A newly allocated #GstMpegtsNITStream
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gst_mpegts_nit_stream_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstMpegtsNITStream*) __p);
	}
}
