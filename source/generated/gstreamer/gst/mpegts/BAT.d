module gst.mpegts.BAT;

private import glib.MemorySlice;
private import glib.PtrArray;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * DVB Bouquet Association Table (EN 300 468)
 */
public final class BAT
{
	/** the main Gtk struct */
	protected GstMpegtsBAT* gstMpegtsBAT;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsBAT* getBATStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsBAT;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsBAT;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsBAT* gstMpegtsBAT, bool ownedRef = false)
	{
		this.gstMpegtsBAT = gstMpegtsBAT;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsBAT);
	}


	/** */
	public @property PtrArray descriptors()
	{
		return new PtrArray(gstMpegtsBAT.descriptors, false);
	}

	/** Ditto */
	public @property void descriptors(PtrArray value)
	{
		gstMpegtsBAT.descriptors = value.getPtrArrayStruct();
	}

	/** */
	public @property PtrArray streams()
	{
		return new PtrArray(gstMpegtsBAT.streams, false);
	}

	/** Ditto */
	public @property void streams(PtrArray value)
	{
		gstMpegtsBAT.streams = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_bat_get_type();
	}
}
