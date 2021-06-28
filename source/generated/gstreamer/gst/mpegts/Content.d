module gst.mpegts.Content;

private import glib.MemorySlice;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class Content
{
	/** the main Gtk struct */
	protected GstMpegtsContent* gstMpegtsContent;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsContent* getContentStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsContent;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsContent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsContent* gstMpegtsContent, bool ownedRef = false)
	{
		this.gstMpegtsContent = gstMpegtsContent;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsContent);
	}


	/** */
	public @property GstMpegtsContentNibbleHi contentNibble1()
	{
		return gstMpegtsContent.contentNibble1;
	}

	/** Ditto */
	public @property void contentNibble1(GstMpegtsContentNibbleHi value)
	{
		gstMpegtsContent.contentNibble1 = value;
	}

	/** */
	public @property ubyte contentNibble2()
	{
		return gstMpegtsContent.contentNibble2;
	}

	/** Ditto */
	public @property void contentNibble2(ubyte value)
	{
		gstMpegtsContent.contentNibble2 = value;
	}

	/** */
	public @property ubyte userByte()
	{
		return gstMpegtsContent.userByte;
	}

	/** Ditto */
	public @property void userByte(ubyte value)
	{
		gstMpegtsContent.userByte = value;
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_content_get_type();
	}
}
