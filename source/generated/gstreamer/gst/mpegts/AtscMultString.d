module gst.mpegts.AtscMultString;

private import glib.MemorySlice;
private import glib.PtrArray;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class AtscMultString
{
	/** the main Gtk struct */
	protected GstMpegtsAtscMultString* gstMpegtsAtscMultString;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsAtscMultString* getAtscMultStringStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsAtscMultString;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsAtscMultString;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsAtscMultString* gstMpegtsAtscMultString, bool ownedRef = false)
	{
		this.gstMpegtsAtscMultString = gstMpegtsAtscMultString;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsAtscMultString);
	}


	/**
	 * The ISO639 language code
	 */
	public @property char[4] iso639Langcode()
	{
		return gstMpegtsAtscMultString.iso639Langcode;
	}

	/** Ditto */
	public @property void iso639Langcode(char[4] value)
	{
		gstMpegtsAtscMultString.iso639Langcode = value;
	}

	/** */
	public @property PtrArray segments()
	{
		return new PtrArray(gstMpegtsAtscMultString.segments, false);
	}

	/** Ditto */
	public @property void segments(PtrArray value)
	{
		gstMpegtsAtscMultString.segments = value.getPtrArrayStruct();
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_atsc_mult_string_get_type();
	}
}
