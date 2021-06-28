module gst.mpegts.ISO639LanguageDescriptor;

private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class ISO639LanguageDescriptor
{
	/** the main Gtk struct */
	protected GstMpegtsISO639LanguageDescriptor* gstMpegtsISO639LanguageDescriptor;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsISO639LanguageDescriptor* getISO639LanguageDescriptorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsISO639LanguageDescriptor;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsISO639LanguageDescriptor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsISO639LanguageDescriptor* gstMpegtsISO639LanguageDescriptor, bool ownedRef = false)
	{
		this.gstMpegtsISO639LanguageDescriptor = gstMpegtsISO639LanguageDescriptor;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsISO639LanguageDescriptor);
	}


	/** */
	public @property uint nbLanguage()
	{
		return gstMpegtsISO639LanguageDescriptor.nbLanguage;
	}

	/** Ditto */
	public @property void nbLanguage(uint value)
	{
		gstMpegtsISO639LanguageDescriptor.nbLanguage = value;
	}

	/** */
	public @property string[64] language()
	{
		string[64] arr;
		foreach( i, str; gstMpegtsISO639LanguageDescriptor.language )
		{
			arr[i] = Str.toString(str);
		}
		return arr;
	}

	/** Ditto */
	public @property void language(string[64] value)
	{
		char*[64] arr;
		foreach( i, str; value )
		{
			arr[i] = Str.toStringz(str);
		}
		gstMpegtsISO639LanguageDescriptor.language = arr;
	}

	/** */
	public @property GstMpegtsIso639AudioType[64] audioType()
	{
		return gstMpegtsISO639LanguageDescriptor.audioType;
	}

	/** Ditto */
	public @property void audioType(GstMpegtsIso639AudioType[64] value)
	{
		gstMpegtsISO639LanguageDescriptor.audioType = value;
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_iso_639_language_get_type();
	}

	/** */
	public void descriptorFree()
	{
		gst_mpegts_iso_639_language_descriptor_free(gstMpegtsISO639LanguageDescriptor);
	}
}
