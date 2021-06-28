module gst.mpegts.ComponentDescriptor;

private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class ComponentDescriptor
{
	/** the main Gtk struct */
	protected GstMpegtsComponentDescriptor* gstMpegtsComponentDescriptor;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsComponentDescriptor* getComponentDescriptorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsComponentDescriptor;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsComponentDescriptor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsComponentDescriptor* gstMpegtsComponentDescriptor, bool ownedRef = false)
	{
		this.gstMpegtsComponentDescriptor = gstMpegtsComponentDescriptor;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsComponentDescriptor);
	}


	/** */
	public @property ubyte streamContent()
	{
		return gstMpegtsComponentDescriptor.streamContent;
	}

	/** Ditto */
	public @property void streamContent(ubyte value)
	{
		gstMpegtsComponentDescriptor.streamContent = value;
	}

	/** */
	public @property ubyte componentType()
	{
		return gstMpegtsComponentDescriptor.componentType;
	}

	/** Ditto */
	public @property void componentType(ubyte value)
	{
		gstMpegtsComponentDescriptor.componentType = value;
	}

	/** */
	public @property ubyte componentTag()
	{
		return gstMpegtsComponentDescriptor.componentTag;
	}

	/** Ditto */
	public @property void componentTag(ubyte value)
	{
		gstMpegtsComponentDescriptor.componentTag = value;
	}

	/** */
	public @property string languageCode()
	{
		return Str.toString(gstMpegtsComponentDescriptor.languageCode);
	}

	/** Ditto */
	public @property void languageCode(string value)
	{
		gstMpegtsComponentDescriptor.languageCode = Str.toStringz(value);
	}

	/** */
	public @property string text()
	{
		return Str.toString(gstMpegtsComponentDescriptor.text);
	}

	/** Ditto */
	public @property void text(string value)
	{
		gstMpegtsComponentDescriptor.text = Str.toStringz(value);
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_component_descriptor_get_type();
	}

	/** */
	public static void free(ComponentDescriptor source)
	{
		gst_mpegts_dvb_component_descriptor_free((source is null) ? null : source.getComponentDescriptorStruct());
	}
}
