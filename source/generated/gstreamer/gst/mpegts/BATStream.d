module gst.mpegts.BATStream;

private import glib.MemorySlice;
private import glib.PtrArray;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class BATStream
{
	/** the main Gtk struct */
	protected GstMpegtsBATStream* gstMpegtsBATStream;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsBATStream* getBATStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsBATStream;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsBATStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsBATStream* gstMpegtsBATStream, bool ownedRef = false)
	{
		this.gstMpegtsBATStream = gstMpegtsBATStream;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsBATStream);
	}


	/** */
	public @property ushort transportStreamId()
	{
		return gstMpegtsBATStream.transportStreamId;
	}

	/** Ditto */
	public @property void transportStreamId(ushort value)
	{
		gstMpegtsBATStream.transportStreamId = value;
	}

	/** */
	public @property ushort originalNetworkId()
	{
		return gstMpegtsBATStream.originalNetworkId;
	}

	/** Ditto */
	public @property void originalNetworkId(ushort value)
	{
		gstMpegtsBATStream.originalNetworkId = value;
	}

	/** */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsBATStream.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsBATStream.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_bat_stream_get_type();
	}
}
